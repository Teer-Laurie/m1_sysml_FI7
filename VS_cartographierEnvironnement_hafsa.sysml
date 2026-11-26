package SequencesRAL_Cartographie {

    package parts {
        part def Utilisateur;
        part def ApplicationMobile;
        part def RobotNettoyeur;
        part def ModuleCartographie;
        part def CapteursObstacles;

        item def Carte;
        item def Zones;
    }

    package sequences {

        private import SequencesRAL_Cartographie::parts::*;

        /* scénario nominal : cartographie, consultation et modification des zones */
        occurrence cartographierEnvironnementNominal {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;
            part cartographie : ModuleCartographie;
            part capteurs : CapteursObstacles;

            // cartographie pendant le déplacement (EF-05, EF-06)
            message demarrerCartographie from robot to cartographie;
            message detecterEnvironnement from capteurs to cartographie;
            message construireCarte from cartographie to cartographie;
            message signalerObstacle from capteurs to robot;
            message adapterParcours from robot to robot;
            message mettreAJourCarte from robot to cartographie;
            message transmettreCarte of Carte from cartographie to robot;

            // consultation (EF-07)
            message demanderCarte from utilisateur to application;
            message verifierConnexion from application to robot;
            message envoyerCarte of Carte from robot to application;
            message afficherCarte of Carte from application to utilisateur;

            // modification des zones (EF-03)
            message modifierZones of Zones from utilisateur to application;
            message envoyerZones of Zones from application to robot;
            message enregistrerZones of Zones from robot to cartographie;
            message confirmerZones from application to utilisateur;
        }

        /* scénario alternatif : robot hors ligne (EF-30) */
        occurrence cartographierEnvironnementHorsLigne {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;

            message demanderCarte from utilisateur to application;
            message verifierConnexion from application to robot;
            message delaiDepasse from application to application;
            message afficherMessageErreur from application to utilisateur;
        }
    }
}
