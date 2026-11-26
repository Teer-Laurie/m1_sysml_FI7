package SequencesRAL_Maintenance {

    package parts {
        part def Utilisateur;
        part def ApplicationMobile;
        part def RobotNettoyeur;
        part def ModuleDiagnostic;
        part def Brosse;
        part def Filtre;

        item def Alerte;
        item def GuideEntretien;
    }

    package sequences {

        private import SequencesRAL_Maintenance::parts::*;

        /* scénario nominal : anomalie détectée, intervention réussie */
        occurrence effectuerMaintenanceNominal {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;
            part diagnostic : ModuleDiagnostic;
            part brosse : Brosse;
            part filtre : Filtre;

            // détection en fin de session (EF-24)
            message demanderDiagnostic from robot to diagnostic;
            message mesurerEtatBrosse from diagnostic to brosse;
            message retournerEtatBrosse from brosse to diagnostic;
            message mesurerEtatFiltre from diagnostic to filtre;
            message retournerEtatFiltre from filtre to diagnostic;
            message analyserEtat from diagnostic to diagnostic;
            message signalerAnomalie of Alerte from diagnostic to robot;

            // alerte avant la panne (EF-25)
            message envoyerAlerte of Alerte from robot to application;
            message notifierEntretien of Alerte from application to utilisateur;

            // guide d'entretien (EF-28)
            message demanderGuide from utilisateur to application;
            message afficherGuide of GuideEntretien from application to utilisateur;

            // intervention et vérification (EF-29)
            message intervenirSurComposant from utilisateur to robot;
            message confirmerIntervention from utilisateur to application;
            message demanderVerification from application to robot;
            message verifierEtat from robot to diagnostic;
            message etatRetabli from diagnostic to robot;
            message reinitialiserSuiviUsure from robot to diagnostic;
            message confirmerRetablissement from robot to application;
            message afficherConfirmation from application to utilisateur;
        }

        /* scénario alternatif : l'anomalie persiste après l'intervention */
        occurrence effectuerMaintenanceAnomaliePersistante {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;
            part diagnostic : ModuleDiagnostic;

            message confirmerIntervention from utilisateur to application;
            message demanderVerification from application to robot;
            message verifierEtat from robot to diagnostic;
            message anomaliePersistante of Alerte from diagnostic to robot;
            message signalerPersistance of Alerte from robot to application;
            message notifierPersistance of Alerte from application to utilisateur;
        }
    }
}
