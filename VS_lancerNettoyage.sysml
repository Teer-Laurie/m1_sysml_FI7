package AspiCoo_Lancer {

    package parts {
        part def InterfaceNettoyage;
        part def RobotAspirateur;
        part def ModuleCartographie;
        part def ReservoirDechets;
        part def Station;
        part def SachetDechets;
    }

    package sequences {

        private import AspiCoo_Lancer::parts::*;

        occurrence lancerNettoyage {

            part Utilisateur: InterfaceNettoyage;
            part robot: RobotAspirateur;
            part cartographie: ModuleCartographie;
            part reservoirs: ReservoirDechets;
            part station: Station;
            part sachet: SachetDechets;

            message lancerNettoyage from Utilisateur to robot;

            message verifierSession from robot to robot;

            message demarrerRobot from robot to robot;

            message demanderCartographie from robot to cartographie;

            message transmettreCartographie from cartographie to robot;

            message analyserSurface from robot to robot;

            message adapterModeNettoyage from robot to robot;

            message effectuerAspirationOuLavage from robot to robot;

            message collecterDechets from robot to reservoirs;

            message compacterDechets from reservoirs to reservoirs;

            message verifierFinNettoyage from robot to robot;

            message reprendreNettoyage from robot to robot;

            message terminerSession from robot to robot;

            message retournerStation from robot to station;

            message viderReservoirRobot from robot to station;

            message transfererDechetsVersSachet from station to sachet;

            message rechargerRobot from station to robot;

            message notifierFinNettoyage from robot to Utilisateur;
        }
    }
}