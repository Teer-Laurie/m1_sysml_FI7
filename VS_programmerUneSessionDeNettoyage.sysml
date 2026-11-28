package SequencesRAL_Programmer {

    package parts {
        part def Utilisateur;
        part def ApplicationMobile;
        part def ModuleProgrammation;
        part def BaseDeDonnees;
        part def GestionnaireCommunication;
        part def ModulePilotage;
    }

    package sequences {

        private import SequencesRAL_Programmer::parts::*;

        /* A : scénario nominal */
        occurrence programmerNettoyageNominal {
            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part programmation : ModuleProgrammation;
            part bdd : BaseDeDonnees;
            part communication : GestionnaireCommunication;
            part pilotage : ModulePilotage;

            message ouvrirProgrammation from utilisateur to application;
            message saisirParametres from utilisateur to application;
            message transmettreParametres from application to programmation;
            message verifierParametres from programmation to programmation;
            message enregistrerSession from programmation to bdd;
            message sessionEnregistree from bdd to programmation;
            message confirmerProgrammation from programmation to application;
            message afficherConfirmation from application to utilisateur;
            message attendreHeure from programmation to programmation;
            message envoyerDemarrage from programmation to communication;
            message relayerDemarrage from communication to pilotage;
            message demarrerCycle from pilotage to pilotage;
        }

        /* B : paramètres invalides */
        occurrence programmerNettoyageParametresInvalides {
            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part programmation : ModuleProgrammation;
            part bdd : BaseDeDonnees;

            message ouvrirProgrammation from utilisateur to application;
            message saisirParametres from utilisateur to application;
            message transmettreParametres from application to programmation;
            message verifierParametres from programmation to programmation;
            message parametresInvalides from programmation to application;
            message afficherErreur from application to utilisateur;
            message corrigerParametres from utilisateur to application;
            message transmettreParametresCorriges from application to programmation;
            message verifierParametresCorriges from programmation to programmation;
            message enregistrerSession from programmation to bdd;
            message confirmerProgrammation from programmation to application;
            message afficherConfirmation from application to utilisateur;
        }

        /* C : robot indisponible à l'heure prévue */
        occurrence programmerNettoyageRobotIndisponible {
            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part programmation : ModuleProgrammation;
            part bdd : BaseDeDonnees;
            part communication : GestionnaireCommunication;

            message attendreHeure from programmation to programmation;
            message envoyerDemarrage from programmation to communication;
            message verifierDisponibiliteRobot from communication to communication;
            message robotIndisponible from communication to programmation;
            message reporterSession from programmation to bdd;
            message notifierReport from programmation to application;
            message afficherReport from application to utilisateur;
        }
    }
}
