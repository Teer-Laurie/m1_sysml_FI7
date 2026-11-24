package MaintenanceRAL {

    package parts {
        part def Utilisateur;
        part def ModulePilotageNettoyage;
        part def ModuleAcquisitionEtat;
        part def ModuleDiagnostic;
        part def ModuleGuideEntretien;
        part def GestionnaireCommunication;
        part def InterfaceApplication;

        item def EtatComposants;
        item def Notification;
        item def FicheEntretien;
    }

    private import MaintenanceRAL::parts::*;

    package sequences {

        /* Scénario A : aucune anomalie */
        occurrence maintenanceS1 {
            part modulePilotageNettoyage : ModulePilotageNettoyage;
            part moduleDiagnostic : ModuleDiagnostic;
            part moduleAcquisitionEtat : ModuleAcquisitionEtat;

            message signalerFinSession from modulePilotageNettoyage to moduleDiagnostic;
            message demanderMesures from moduleDiagnostic to moduleAcquisitionEtat;
            message mesuresEtat of EtatComposants from moduleAcquisitionEtat to moduleDiagnostic;
            message etatNominal from moduleDiagnostic to modulePilotageNettoyage;
        }

        /* Scénario B : anomalie résolue */
        occurrence maintenanceS2 {
            part modulePilotageNettoyage : ModulePilotageNettoyage;
            part moduleDiagnostic : ModuleDiagnostic;
            part moduleAcquisitionEtat : ModuleAcquisitionEtat;
            part moduleGuideEntretien : ModuleGuideEntretien;
            part gestionnaireCommunication : GestionnaireCommunication;
            part interfaceApplication : InterfaceApplication;
            part utilisateur : Utilisateur;

            message signalerFinSession from modulePilotageNettoyage to moduleDiagnostic;
            message demanderMesures from moduleDiagnostic to moduleAcquisitionEtat;
            message mesuresEtat of EtatComposants from moduleAcquisitionEtat to moduleDiagnostic;
            message alerteEntretien of Notification from moduleDiagnostic to gestionnaireCommunication;
            message notificationEntretien of Notification from gestionnaireCommunication to interfaceApplication;
            message afficherNotificationEntretien from interfaceApplication to utilisateur;

            message demanderGuide from utilisateur to interfaceApplication;
            message chercherFiche from interfaceApplication to moduleGuideEntretien;
            message ficheEntretien of FicheEntretien from moduleGuideEntretien to interfaceApplication;
            message afficherGuide from interfaceApplication to utilisateur;

            message signalerIntervention from utilisateur to interfaceApplication;
            message demanderVerification from interfaceApplication to gestionnaireCommunication;
            message verifierEtat from gestionnaireCommunication to moduleDiagnostic;
            message demanderNouvellesMesures from moduleDiagnostic to moduleAcquisitionEtat;
            message nouvellesMesures of EtatComposants from moduleAcquisitionEtat to moduleDiagnostic;
            message reinitialiserCompteursUsure from moduleDiagnostic to moduleAcquisitionEtat;
            message confirmationEtatRetabli of Notification from moduleDiagnostic to gestionnaireCommunication;
            message confirmationTransmise of Notification from gestionnaireCommunication to interfaceApplication;
            message afficherConfirmation from interfaceApplication to utilisateur;
        }

        /* Scénario C : anomalie persistante */
        occurrence maintenanceS3 {
            part modulePilotageNettoyage : ModulePilotageNettoyage;
            part moduleDiagnostic : ModuleDiagnostic;
            part moduleAcquisitionEtat : ModuleAcquisitionEtat;
            part moduleGuideEntretien : ModuleGuideEntretien;
            part gestionnaireCommunication : GestionnaireCommunication;
            part interfaceApplication : InterfaceApplication;
            part utilisateur : Utilisateur;

            message signalerFinSession from modulePilotageNettoyage to moduleDiagnostic;
            message demanderMesures from moduleDiagnostic to moduleAcquisitionEtat;
            message mesuresEtat of EtatComposants from moduleAcquisitionEtat to moduleDiagnostic;
            message alerteEntretien of Notification from moduleDiagnostic to gestionnaireCommunication;
            message notificationEntretien of Notification from gestionnaireCommunication to interfaceApplication;
            message afficherNotificationEntretien from interfaceApplication to utilisateur;

            message demanderGuide from utilisateur to interfaceApplication;
            message chercherFiche from interfaceApplication to moduleGuideEntretien;
            message ficheEntretien of FicheEntretien from moduleGuideEntretien to interfaceApplication;
            message afficherGuide from interfaceApplication to utilisateur;

            message signalerIntervention from utilisateur to interfaceApplication;
            message demanderVerification from interfaceApplication to gestionnaireCommunication;
            message verifierEtat from gestionnaireCommunication to moduleDiagnostic;
            message demanderNouvellesMesures from moduleDiagnostic to moduleAcquisitionEtat;
            message nouvellesMesures of EtatComposants from moduleAcquisitionEtat to moduleDiagnostic;
            message alerteAnomaliePersistante of Notification from moduleDiagnostic to gestionnaireCommunication;
            message notificationAnomaliePersistante of Notification from gestionnaireCommunication to interfaceApplication;
            message afficherAnomaliePersistante from interfaceApplication to utilisateur;
        }
    }
}