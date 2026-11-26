package RAL_VueInterconnexion {

    package Parts {
        /* ports */
        port def BoutonMateriel;
        port def PortCharge;
        port def PortEvacuation;
        port def PortLiquides;
        port def AntenneWifi;

        /* robot */
        part def RobotNettoyeur;
        part def CarteElectronique;
        part def MicroControleur;
        part def ModuleCartographie;
        part def ModuleDiagnostic;
        part def UniteCommunicationWifi;
        part def ControleurMoteurs;
        part def CapteursObstacles;
        part def CapteurSurface;
        part def CapteurSalete;
        part def MoteurDeplacement;
        part def Aspirateur;
        part def BrossePrincipale;
        part def Filtre;
        part def ModuleLavage;
        part def ReservoirDechets;
        part def Compacteur;
        part def Batterie;

        /* station */
        part def StationRechargeEvacuation;
        part def CarteStation;
        part def UniteAlimentationElectrique;
        part def SystemeEvacuation;
        part def MagasinSachets;
        part def CapteurNiveauSachet;
        part def ReservoirEau;
        part def ReservoirProduit;
        part def CapteursNiveauLiquides;

        /* système */
        part def SystemeRAL;
    }

    private import Parts::*;

    part systeme : SystemeRAL {

        /* ================= ROBOT ================= */
        part robot : RobotNettoyeur {
            in port boutonCommande : BoutonMateriel;

            part carteElectronique : CarteElectronique {
                part microControleur : MicroControleur;
                part cartographie : ModuleCartographie;
                part diagnostic : ModuleDiagnostic;
                part uniteWifi : UniteCommunicationWifi;
                part controleurMoteurs : ControleurMoteurs;
                inout port antenne : AntenneWifi;
                in port alimentation;

                connect microControleur to cartographie;
                connect microControleur to diagnostic;
                connect microControleur to uniteWifi;
                connect microControleur to controleurMoteurs;
                connect uniteWifi to antenne;
            }

            part capteursObstacles : CapteursObstacles;
            part capteurSurface : CapteurSurface;
            part capteurSalete : CapteurSalete;
            part moteurs : MoteurDeplacement[2];
            part aspirateur : Aspirateur;
            part brosse : BrossePrincipale;
            part filtre : Filtre;
            part lavage : ModuleLavage;
            part reservoir : ReservoirDechets;
            part compacteur : Compacteur;

            part batterie : Batterie {
                in port charge;
                out port basseTension;
            }

            in port portCharge : PortCharge;
            out port sortieDechets : PortEvacuation;
            in port entreeLiquides : PortLiquides;
            inout port antenneWifi : AntenneWifi;

            /* commande et perception */
            connect boutonCommande to carteElectronique;
            connect capteursObstacles to carteElectronique;
            connect capteurSurface to carteElectronique;
            connect capteurSalete to carteElectronique;
            connect brosse to carteElectronique;
            connect filtre to carteElectronique;

            /* actionneurs */
            connect carteElectronique to moteurs;
            connect carteElectronique to aspirateur;
            connect carteElectronique to lavage;
            connect carteElectronique to compacteur;

            /* chaîne des déchets */
            connect aspirateur to reservoir;
            connect compacteur to reservoir;
            connect reservoir to sortieDechets;

            /* énergie */
            connect portCharge to batterie.charge;
            connect batterie.basseTension to carteElectronique.alimentation;

            /* liquides et communication */
            connect entreeLiquides to lavage;
            connect carteElectronique.antenne to antenneWifi;
        }

        /* ================= STATION ================= */
        part station : StationRechargeEvacuation {
            part carteStation : CarteStation;

            part uniteAlimentationElectrique : UniteAlimentationElectrique {
                in port hauteTension;
                out port basseTension;
            }

            part evacuation : SystemeEvacuation;
            part sachets : MagasinSachets;
            part capteurSachet : CapteurNiveauSachet;
            part reservoirEau : ReservoirEau;
            part reservoirProduit : ReservoirProduit;
            part capteursLiquides : CapteursNiveauLiquides;

            in port hauteTension;
            out port sortieCharge : PortCharge;
            in port entreeDechets : PortEvacuation;
            out port sortieLiquides : PortLiquides;
            inout port antenneWifi : AntenneWifi;

            connect hauteTension to uniteAlimentationElectrique.hauteTension;
            connect uniteAlimentationElectrique.basseTension to carteStation;
            connect uniteAlimentationElectrique.basseTension to sortieCharge;

            connect entreeDechets to evacuation;
            connect evacuation to sachets;
            connect capteurSachet to carteStation;
            connect carteStation to evacuation;

            connect reservoirEau to sortieLiquides;
            connect reservoirProduit to sortieLiquides;
            connect capteursLiquides to carteStation;
            connect carteStation to antenneWifi;
        }

        /* ================= LIENS ROBOT - STATION ================= */
        connect station.sortieCharge to robot.portCharge;
        connect robot.sortieDechets to station.entreeDechets;
        connect station.sortieLiquides to robot.entreeLiquides;
    }
}
