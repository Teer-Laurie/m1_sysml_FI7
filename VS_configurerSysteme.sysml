package systemeRobot {

    package parts {
        part def Utilisateur;
        part def Smartphone;
        part def Application;
        part def Robot;
        part def ReseauWifi;
        part def QRCode;
        part def MenuParametrage;
        part def Message;

        item def Identifiant;
        item def Compte;
        item def Parametres;
    }

    private import systemeRobot::parts::*;

    package sequences {
        occurrence configurerSysteme {
            part utilisateur : Utilisateur;
            part smartphone : Smartphone;
            part application : Application;
            part robot : Robot;
            part wifi : ReseauWifi;
            part qrCode : QRCode;
            part menuParametrage : MenuParametrage;
            part messageAlerte : Message;

            // Installation de l'application
            message installerApplication from utilisateur to smartphone;
            message installer from smartphone to application;
            message applicationInstallee from application to utilisateur;

            // Connexion du robot au WiFi
            message connecterWifi from robot to wifi;
            message connexionEtablie from wifi to robot;

            // Cas alternatif : robot non connecté
            message robotNonConnecte from wifi to robot;
            message afficherAlerte from robot to messageAlerte;
            message alerte from messageAlerte to utilisateur;

            // Connexion du robot à l'application
            message connecterRobot from application to robot;
            message robotConnecte from robot to application;

            // Alternative 1 : scan du QR code
            message scanner from application to qrCode;
            message identifiantScanne of Identifiant from qrCode to application;

            // Alternative 2 : saisie manuelle
            message saisirIdentifiant of Identifiant from utilisateur to application;

            // Vérification de l'identifiant
            message verifierIdentifiant of Identifiant from application to robot;
            message identifiantCorrect from robot to application;

            // Création du compte
            message creerCompte of Compte from utilisateur to application;
            message compteCree from application to utilisateur;

            // Choix des paramètres
            message afficherMenu from utilisateur to application;
            message afficherContenu from application to menuParametrage;
            message menuAffiche from menuParametrage to application;
            message choisirParametres of Parametres from utilisateur to application;
            message parametresEnregistres from application to utilisateur;
        }
    }
}
