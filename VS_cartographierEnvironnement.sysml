package systemeRobot {

    package parts {
        part def Utilisateur;
        part def Application;
        part def Robot;
        part def Environnement;
        part def Memoire;
        part def Message;

        item def Option;
        item def DonneesCarte;
    }

    private import systemeRobot::parts::*;

    package sequences {
        occurrence cartographierEnvironnement {
            part utilisateur : Utilisateur;
            part application : Application;
            part robot : Robot;
            part environnement : Environnement;
            part memoire : Memoire;
            part messageErreur : Message;

            // Démarrage du robot
            message demarrerRobot from utilisateur to robot;
            message robotDemarre from robot to utilisateur;

            // Choix de l'option
            message choisirOption of Option from utilisateur to application;
            message optionChoisie from application to utilisateur;

            // Lancement du robot
            message lancerRobot from application to robot;
            message robotLance from robot to application;

            // Cartographie
            message cartographier from robot to environnement;
            message espaceCartographie of DonneesCarte from environnement to robot;

            // Alternative : espace mal cartographié
            message espaceMalCartographie from robot to application;
            message afficherErreurCartographie from application to messageErreur;
            message erreurCartographieAffichee from messageErreur to utilisateur;
            message recommencerCartographie from utilisateur to application;
            message relancerCartographie from application to robot;
            message annulerCartographie from utilisateur to application;

            // Sauvegarde des données
            message sauvegarder of DonneesCarte from robot to memoire;
            message donneesSauvegardees from memoire to robot;

            // Envoi des données à l'application
            message envoyerDonnees of DonneesCarte from robot to application;
            message donneesRecues from application to robot;

            // Alternative : données non reçues
            message donneesNonRecues from application to messageErreur;
            message erreurEnvoiAffichee from messageErreur to utilisateur;
            message recommencerEnvoi from utilisateur to application;
            message relancerEnvoi from application to robot;
            message annulerEnvoi from utilisateur to application;

            // Vérification et validation
            message afficherDonnees of DonneesCarte from application to utilisateur;
            message validerDonnees from utilisateur to application;

            // Enregistrement final
            message enregistrementFinal of DonneesCarte from application to memoire;
            message enregistrementTermine from memoire to application;
            message cartographieTerminee from application to utilisateur;
        }
    }
}
