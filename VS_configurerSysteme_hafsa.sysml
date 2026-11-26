package SequencesRAL_Configuration {

    package parts {
        part def Utilisateur;
        part def Smartphone;
        part def ApplicationMobile;
        part def RobotNettoyeur;
        part def ReseauWifi;

        item def QRCode;
        item def Identifiant;
        item def Compte;
        item def Parametres;
        item def Carte;
        item def MessageAlerte;
    }

    package sequences {

        private import SequencesRAL_Configuration::parts::*;

        /* scénario nominal : Wi-Fi OK, identification par QR code */
        occurrence configurerSystemeNominal {

            part utilisateur : Utilisateur;
            part smartphone : Smartphone;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;
            part wifi : ReseauWifi;

            // installation de l'application
            message installerApplication from utilisateur to smartphone;
            message lancerApplication from smartphone to application;

            // connexion du robot au Wi-Fi
            message connecterWifi from robot to wifi;
            message connexionEtablie from wifi to robot;

            // appairage par QR code
            message scannerQRCode of QRCode from utilisateur to application;
            message verifierIdentifiant of Identifiant from application to robot;
            message identifiantCorrect from robot to application;

            // création du compte
            message creerCompte of Compte from utilisateur to application;
            message compteCree from application to utilisateur;

            // paramétrage
            message choisirParametres of Parametres from utilisateur to application;
            message envoyerParametres of Parametres from application to robot;
            message parametresEnregistres from application to utilisateur;

            // première cartographie
            message demanderCartographie from utilisateur to application;
            message lancerCartographie from application to robot;
            message cartographierEspace from robot to robot;
            message envoyerCarte of Carte from robot to application;
            message afficherCarte of Carte from application to utilisateur;
        }

        /* scénario alternatif : robot non connecté au Wi-Fi */
        occurrence configurerSystemeEchecWifi {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;
            part wifi : ReseauWifi;

            message connecterWifi from robot to wifi;
            message connexionRefusee from wifi to robot;
            message signalerEchecConnexion from robot to application;
            message afficherAlerte of MessageAlerte from application to utilisateur;
        }

        /* scénario alternatif : identification par saisie manuelle */
        occurrence configurerSystemeSaisieManuelle {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;

            message saisirIdentifiant of Identifiant from utilisateur to application;
            message verifierIdentifiant of Identifiant from application to robot;
            message identifiantCorrect from robot to application;
        }
    }
}
