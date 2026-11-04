package AspiCoo_Lancer {

    action vueLancerNettoyage {

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
        action retournerStation;
        action viderReservoirRobot;
        action rechargerRobot;
        action reprendreNettoyage;
        action terminerSession;

        merge choixMode;
        merge finNettoyage;

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

        succession effectuerAspiration then choixMode;
        succession effectuerLavage then choixMode;

        then collecterDechets;
        then compacterDechets;
        then verifierFinNettoyage;

        then decide decisionFin;

        if nettoyageIncomplet then reprendreNettoyage;
        if nettoyageTermine then terminerSession;

        succession reprendreNettoyage then exploiterCartographie;

        then done;
    }
}