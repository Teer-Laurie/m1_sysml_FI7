package AspiCoo_Entretenir {

    package parts {
        part def InterfaceEntretien;
        part def RobotAspirateur;
        part def ModuleControle;
        part def Reservoirs;
        part def Accessoires;
        part def Station;
        part def SachetDechets;
    }

    package sequences {

        private import AspiCoo_Entretenir::parts::*;

        occurrence entretenirSysteme {

            part interfaceUtilisateur: InterfaceEntretien;
            part robot: RobotAspirateur;
            part moduleControle: ModuleControle;
            part reservoirs: Reservoirs;
            part accessoires: Accessoires;
            part station: Station;
            part sachet: SachetDechets;

            message lancerEntretien from interfaceUtilisateur to robot;

            message controlerEtatRobot from robot to moduleControle;

            message controlerNiveauDesReservoirs from moduleControle to reservoirs;

            message signalerBesoinRemplissageEau from reservoirs to robot;
            message signalerBesoinRemplissageProduit from reservoirs to robot;

            message notifierRemplissageEau from robot to interfaceUtilisateur;
            message notifierRemplissageProduit from robot to interfaceUtilisateur;

            message signalerNettoyageAccessoires from robot to accessoires;

            message controlerEtatStation from robot to station;

            message controlerEtatSachet from robot to sachet;

            message signalerRetraitSachetPlein from sachet to robot;

            message notifierRetraitSachet from robot to interfaceUtilisateur;

            message terminerEntretien from robot to interfaceUtilisateur;
        }
    }
}