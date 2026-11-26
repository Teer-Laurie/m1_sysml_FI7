package AspiCoo_Lancer {

    private import ScalarValues::Boolean;

    action vueLancerNettoyage {

        attribute modeAspiration : Boolean;
        attribute modeLavage : Boolean;
        attribute nettoyageIncomplet : Boolean;
        attribute nettoyageTermine : Boolean;

        action recevoirDemande;
        action verifierSession;
        action demarrerRobot;
        action exploiterCartographie;
        action analyserSurface;
        action adapterNettoyage;
        action effectuerAspiration;
        action effectuerLavage;
        action collecterDechets;
        action compacterDechets;
        action verifierFinNettoyage;
        action reprendreNettoyage;
        action terminerSession;
        action retournerStation;
        action viderReservoirRobot;
        action transfererDechetsVersSachet;
        action rechargerRobot;
        action mettreEnVeille;

        merge choixMode;

        decide decisionMode;
        decide decisionFin;

        first start;

        then recevoirDemande;
        then verifierSession;
        then demarrerRobot;
        then exploiterCartographie;
        then analyserSurface;
        then adapterNettoyage;

        then decide decisionMode;

        if modeAspiration then effectuerAspiration;
        if modeLavage then effectuerLavage;

        succession first effectuerAspiration then choixMode;
        succession first effectuerLavage then choixMode;

        then collecterDechets;
        then compacterDechets;
        then verifierFinNettoyage;

        then decide decisionFin;

        if nettoyageIncomplet then reprendreNettoyage;
        if nettoyageTermine then terminerSession;

        succession first reprendreNettoyage then verifierFinNettoyage;

        succession first terminerSession then retournerStation;
        succession first retournerStation then viderReservoirRobot;
        succession first viderReservoirRobot then transfererDechetsVersSachet;
        succession first transfererDechetsVersSachet then rechargerRobot;
        succession first rechargerRobot then mettreEnVeille;
        then done;
    }
}