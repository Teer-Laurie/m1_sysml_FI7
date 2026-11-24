package GererDechetsRAL {

    package parts {
        part def Utilisateur;
        part def ModuleCompactage;
        part def ModuleTransfertStockage;
        part def ModuleSurveillanceNiveaux;
        part def ModuleReservoirsLiquides;
        part def GestionnaireCommunication;
        part def InterfaceApplication;

        item def Dechets;
        item def NiveauSachet;
        item def EtatNiveaux;
        item def Notification;
    }

    private import GererDechetsRAL::parts::*;

    package sequences {

        /* Scénario A : nominal */
        occurrence gererDechetsS1 {
            part moduleCompactage : ModuleCompactage;
            part moduleTransfertStockage : ModuleTransfertStockage;
            part moduleSurveillanceNiveaux : ModuleSurveillanceNiveaux;
            part moduleReservoirsLiquides : ModuleReservoirsLiquides;

            message demanderTransfert from moduleCompactage to moduleTransfertStockage;
            message verifierPresenceSachet from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message sachetPresent from moduleSurveillanceNiveaux to moduleTransfertStockage;
            message dechetsCompactes of Dechets from moduleCompactage to moduleTransfertStockage;
            message lireNiveauSachet from moduleSurveillanceNiveaux to moduleTransfertStockage;
            message niveauSachet of NiveauSachet from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message lireNiveauxLiquides from moduleSurveillanceNiveaux to moduleReservoirsLiquides;
            message niveauxLiquides of EtatNiveaux from moduleReservoirsLiquides to moduleSurveillanceNiveaux;
        }

        /* Scénario B : sachet absent */
        occurrence gererDechetsS2 {
            part moduleCompactage : ModuleCompactage;
            part moduleTransfertStockage : ModuleTransfertStockage;
            part moduleSurveillanceNiveaux : ModuleSurveillanceNiveaux;
            part moduleReservoirsLiquides : ModuleReservoirsLiquides;
            part gestionnaireCommunication : GestionnaireCommunication;
            part interfaceApplication : InterfaceApplication;
            part utilisateur : Utilisateur;

            message demanderTransfert from moduleCompactage to moduleTransfertStockage;
            message verifierPresenceSachet from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message alerteSachetAbsent of Notification from moduleSurveillanceNiveaux to gestionnaireCommunication;
            message notificationSachetAbsent of Notification from gestionnaireCommunication to interfaceApplication;
            message afficherAlerteSachetAbsent from interfaceApplication to utilisateur;
            message placerSachet from utilisateur to moduleTransfertStockage;
            message sachetPlace from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message dechetsCompactes of Dechets from moduleCompactage to moduleTransfertStockage;
            message lireNiveauSachet from moduleSurveillanceNiveaux to moduleTransfertStockage;
            message niveauSachet of NiveauSachet from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message lireNiveauxLiquides from moduleSurveillanceNiveaux to moduleReservoirsLiquides;
            message niveauxLiquides of EtatNiveaux from moduleReservoirsLiquides to moduleSurveillanceNiveaux;
        }

        /* Scénario C : sachet plein */
        occurrence gererDechetsS3 {
            part moduleCompactage : ModuleCompactage;
            part moduleTransfertStockage : ModuleTransfertStockage;
            part moduleSurveillanceNiveaux : ModuleSurveillanceNiveaux;
            part moduleReservoirsLiquides : ModuleReservoirsLiquides;
            part gestionnaireCommunication : GestionnaireCommunication;
            part interfaceApplication : InterfaceApplication;
            part utilisateur : Utilisateur;

            message demanderTransfert from moduleCompactage to moduleTransfertStockage;
            message verifierPresenceSachet from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message sachetPresent from moduleSurveillanceNiveaux to moduleTransfertStockage;
            message dechetsCompactes of Dechets from moduleCompactage to moduleTransfertStockage;
            message lireNiveauSachet from moduleSurveillanceNiveaux to moduleTransfertStockage;
            message niveauSachet of NiveauSachet from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message alerteSachetPlein of Notification from moduleSurveillanceNiveaux to gestionnaireCommunication;
            message notificationSachetPlein of Notification from gestionnaireCommunication to interfaceApplication;
            message afficherAlerteSachetPlein from interfaceApplication to utilisateur;
            message lireNiveauxLiquides from moduleSurveillanceNiveaux to moduleReservoirsLiquides;
            message niveauxLiquides of EtatNiveaux from moduleReservoirsLiquides to moduleSurveillanceNiveaux;
        }

        /* Scénario D : niveau de liquide bas */
        occurrence gererDechetsS4 {
            part moduleCompactage : ModuleCompactage;
            part moduleTransfertStockage : ModuleTransfertStockage;
            part moduleSurveillanceNiveaux : ModuleSurveillanceNiveaux;
            part moduleReservoirsLiquides : ModuleReservoirsLiquides;
            part gestionnaireCommunication : GestionnaireCommunication;
            part interfaceApplication : InterfaceApplication;
            part utilisateur : Utilisateur;

            message demanderTransfert from moduleCompactage to moduleTransfertStockage;
            message verifierPresenceSachet from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message sachetPresent from moduleSurveillanceNiveaux to moduleTransfertStockage;
            message dechetsCompactes of Dechets from moduleCompactage to moduleTransfertStockage;
            message lireNiveauSachet from moduleSurveillanceNiveaux to moduleTransfertStockage;
            message niveauSachet of NiveauSachet from moduleTransfertStockage to moduleSurveillanceNiveaux;
            message lireNiveauxLiquides from moduleSurveillanceNiveaux to moduleReservoirsLiquides;
            message niveauxLiquides of EtatNiveaux from moduleReservoirsLiquides to moduleSurveillanceNiveaux;
            message alerteNiveauBas of Notification from moduleSurveillanceNiveaux to gestionnaireCommunication;
            message notificationNiveauBas of Notification from gestionnaireCommunication to interfaceApplication;
            message afficherAlerteNiveauBas from interfaceApplication to utilisateur;
            message remplirReservoirs from utilisateur to moduleReservoirsLiquides;
            message niveauxRetablis of EtatNiveaux from moduleReservoirsLiquides to moduleSurveillanceNiveaux;
        }
    }
}