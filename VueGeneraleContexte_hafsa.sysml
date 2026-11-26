package RAL_VueGenerale {

    package Parts {

        /* composants du robot */
        part def Batterie;
        part def MoteurDeplacement;
        part def CapteursObstacles;
        part def CapteurSurface;
        part def CapteurSalete;
        part def ModuleCartographie;
        part def ModuleDiagnostic;
        part def BrossePrincipale;
        part def Filtre;
        part def Aspirateur;
        part def ModuleLavage;
        part def ReservoirDechets;
        part def Compacteur;
        part def ModuleWifi;
        part def BoutonCommande;
        part def Controleur;

        /* composants de la station */
        part def ChargeurStation;
        part def SystemeEvacuation;
        part def MagasinSachets;
        part def CapteurNiveauSachet;
        part def ReservoirEau;
        part def ReservoirProduit;
        part def CapteursNiveauLiquides;
        part def AlimentationStation;

        /* composants de l'application */
        part def InterfaceUtilisateur;
        part def ModuleProgrammation;
        part def ModuleNotifications;
        part def AffichageCarte;

        /* constituants */
        part def RobotNettoyeur {
            part controleur : Controleur;
            part batterie : Batterie;
            part moteurs : MoteurDeplacement[2];
            part capteursObstacles : CapteursObstacles;
            part capteurSurface : CapteurSurface;
            part capteurSalete : CapteurSalete;
            part cartographie : ModuleCartographie;
            part diagnostic : ModuleDiagnostic;
            part brosse : BrossePrincipale;
            part filtre : Filtre;
            part aspirateur : Aspirateur;
            part lavage : ModuleLavage;
            part reservoir : ReservoirDechets;
            part compacteur : Compacteur;
            part wifi : ModuleWifi;
            part bouton : BoutonCommande;
        }

        part def StationRechargeEvacuation {
            part alimentation : AlimentationStation;
            part chargeur : ChargeurStation;
            part evacuation : SystemeEvacuation;
            part sachets : MagasinSachets;
            part capteurSachet : CapteurNiveauSachet;
            part reservoirEau : ReservoirEau;
            part reservoirProduit : ReservoirProduit;
            part capteursLiquides : CapteursNiveauLiquides;
        }

        part def ApplicationMobile {
            part interface : InterfaceUtilisateur;
            part programmation : ModuleProgrammation;
            part notifications : ModuleNotifications;
            part carte : AffichageCarte;
        }

        /* système d'intérêt */
        part def SystemeRAL {
            part robot : RobotNettoyeur;
            part station : StationRechargeEvacuation;
            part application : ApplicationMobile;
        }
    }
}
