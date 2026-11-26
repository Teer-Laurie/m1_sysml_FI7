package SequencesRAL_Programmer {

    package parts {
        part def Utilisateur;
        part def ApplicationMobile;
        part def ModuleProgrammation;
        part def BaseDeDonnees;
        part def RobotNettoyeur;
    }

    package sequences {

        private import SequencesRAL_Programmer::parts::*;

        /* scénario nominal : paramètres valides */
        occurrence programmerSessionNominal {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part moduleProgrammation : ModuleProgrammation;
            part bdd : BaseDeDonnees;
            part robot : RobotNettoyeur;

            // 1. ouverture de la programmation
            message choisirProgrammer from utilisateur to application;
            message afficherInterfaceProgrammation from application to utilisateur;

            // 2. saisie de la date, de l'heure, de la durée et de l'espace
            message saisirDateHeureDuree from utilisateur to application;
            message choisirEspace from utilisateur to application;
            message transmettreParametres from application to moduleProgrammation;
            message verifierParametres from moduleProgrammation to moduleProgrammation;

            // 3. enregistrement de la session
            message enregistrerSession from moduleProgrammation to bdd;
            message confirmerEnregistrement from bdd to moduleProgrammation;
            message notifierSuccesProgrammation from moduleProgrammation to application;
            message afficherConfirmation from application to utilisateur;

            // 4. déclenchement à la date choisie
            message attendreDateChoisie from moduleProgrammation to moduleProgrammation;
            message demarrerNettoyage from moduleProgrammation to robot;
        }

        /* scénario alternatif : paramètres invalides */
        occurrence programmerSessionParametresInvalides {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part moduleProgrammation : ModuleProgrammation;

            message saisirDateHeureDuree from utilisateur to application;
            message transmettreParametres from application to moduleProgrammation;
            message verifierParametres from moduleProgrammation to moduleProgrammation;
            message notifierParametresInvalides from moduleProgrammation to application;
            message afficherMessageErreur from application to utilisateur;
        }
    }
}
