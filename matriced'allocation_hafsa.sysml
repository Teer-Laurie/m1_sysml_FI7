package RAL_Allocation {

    private import RAL_VueGenerale::*;
    private import RAL_VueInterconnexion::*;

    part def SmartPhone;
    part smartPhone : SmartPhone;

    /* ===== logiciel -> matériel ===== */
    allocate appSmartphone to smartPhone;
    allocate logicielRobot to systeme.robot.carteElectronique;
    allocate logicielStation to systeme.station.carteStation;

    /* ===== détail : modules du robot ===== */
    allocate logicielRobot.gestionnaireSession to systeme.robot.carteElectronique.microControleur;
    allocate logicielRobot.carte to systeme.robot.carteElectronique.cartographie;
    allocate logicielRobot.modes to systeme.robot.carteElectronique.controleurMoteurs;
    allocate logicielRobot.diagnostic to systeme.robot.carteElectronique.diagnostic;
    allocate logicielRobot.alertes to systeme.robot.carteElectronique.uniteWifi;

    /* ===== détail : modules de la station ===== */
    allocate logicielStation.gestionnaireEvacuation to systeme.station.evacuation;
    allocate logicielStation.gestionnaireCharge to systeme.station.uniteAlimentationElectrique;
    allocate logicielStation.niveaux to systeme.station.carteStation;
    allocate logicielStation.alertes to systeme.station.carteStation;
}
