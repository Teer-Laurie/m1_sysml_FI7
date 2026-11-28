package ActionsRAL_Lancer {

    private import ScalarValues::Boolean;

    /* cas d'utilisation lancerNettoyage (EF-01, EF-10 à EF-21) */
    action vueLancerNettoyage {

        attribute sessionValide : Boolean;
        attribute modeAspiration : Boolean;
        attribute modeLavage : Boolean;
        attribute modeMixte : Boolean;
        attribute batterieFaible : Boolean;
        attribute nettoyageIncomplet : Boolean;
        attribute nettoyageTermine : Boolean;

        action recevoirDemande;
        action verifierSession;
        action signalerRefus;
        action demarrerRobot;
        action exploiterCartographie;
        action analyserSurface;
        action adapterNettoyage;
        action effectuerAspiration;
        action effectuerLavage;
        action aspirerMixte;
        action laverMixte;
        action collecterDechets;
        action compacterDechets;
        action verifierFinNettoyage;
        action retourRecharge;
        action reprendreNettoyage;
        action terminerSession;
        action retournerStation;
        action viderReservoirRobot;
        action transfererDechetsVersSachet;
        action rechargerRobot;
        action mettreEnVeille;

        decide decisionSession;
        decide decisionMode;
        decide decisionFin;

        fork forkMixte;
        join joinMixte;

        merge choixMode;
        merge retourAnalyse;
        merge finFlux;

        /* démarrage */
        succession first start then recevoirDemande;
        succession first recevoirDemande then verifierSession;
        succession first verifierSession then decisionSession;

        succession first decisionSession
            if sessionValide then demarrerRobot;
        succession first decisionSession
            if not sessionValide then signalerRefus;
        succession first signalerRefus then finFlux;

        succession first demarrerRobot then exploiterCartographie;
        succession first exploiterCartographie then retourAnalyse;

        /* boucle de nettoyage */
        succession first retourAnalyse then analyserSurface;
        succession first analyserSurface then adapterNettoyage;
        succession first adapterNettoyage then decisionMode;

        succession first decisionMode
            if modeAspiration then effectuerAspiration;
        succession first decisionMode
            if modeLavage then effectuerLavage;
        succession first decisionMode
            if modeMixte then forkMixte;

        succession first forkMixte then aspirerMixte;
        succession first forkMixte then laverMixte;
        succession first aspirerMixte then joinMixte;
        succession first laverMixte then joinMixte;

        succession first effectuerAspiration then choixMode;
        succession first effectuerLavage then choixMode;
        succession first joinMixte then choixMode;

        succession first choixMode then collecterDechets;
        succession first collecterDechets then compacterDechets;
        succession first compacterDechets then verifierFinNettoyage;
        succession first verifierFinNettoyage then decisionFin;

        succession first decisionFin
            if batterieFaible then retourRecharge;
        succession first decisionFin
            if nettoyageIncomplet then reprendreNettoyage;
        succession first decisionFin
            if nettoyageTermine then terminerSession;

        /* batterie faible : recharge puis reprise (EF-16, EF-17) */
        succession first retourRecharge then reprendreNettoyage;
        succession first reprendreNettoyage then retourAnalyse;

        /* fin de session */
        succession first terminerSession then retournerStation;
        succession first retournerStation then viderReservoirRobot;
        succession first viderReservoirRobot then transfererDechetsVersSachet;
        succession first transfererDechetsVersSachet then rechargerRobot;
        succession first rechargerRobot then mettreEnVeille;
        succession first mettreEnVeille then finFlux;

        succession first finFlux then done;
    }
}
