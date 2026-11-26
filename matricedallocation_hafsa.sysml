package RAL_Allocation {

    package Parts {
        part def SmartPhone;
        part def RobotNettoyeur;
        part def StationRechargeEvacuation;
        part def CarteElectronique;
        part def CarteStation;
        part def MicroControleur;
        part def ModuleCartographie;
        part def ModuleDiagnostic;

        part def AppRAL;
        part def LogicielRobot;
        part def LogicielStation;
        part def GestionnaireSession;
        part def Carte;
        part def Diagnostic;
    }

    private import Parts::*;

    /* ===== matériel ===== */
    part smartPhone : SmartPhone;

    part robot : RobotNettoyeur {
        part carteElectronique : CarteElectronique {
            part microControleur : MicroControleur;
            part cartographie : ModuleCartographie;
            part diagnostic : ModuleDiagnostic;
        }
    }

    part station : StationRechargeEvacuation {
        part carteStation : CarteStation;
    }

    /* ===== logiciel ===== */
    part appSmartphone : AppRAL;

    part logicielRobot : LogicielRobot {
        part gestionnaireSession : GestionnaireSession;
        part carte : Carte;
        part diagnostic : Diagnostic;
    }

    part logicielStation : LogicielStation;

    /* ===== allocations ===== */
    allocate appSmartphone to smartPhone;
    allocate logicielRobot to robot.carteElectronique;
    allocate logicielStation to station.carteStation;

    allocate logicielRobot.gestionnaireSession to robot.carteElectronique.microControleur;
    allocate logicielRobot.carte to robot.carteElectronique.cartographie;
    allocate logicielRobot.diagnostic to robot.carteElectronique.diagnostic;
}
