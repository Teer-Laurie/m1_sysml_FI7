package ActionsRAL {

    private import ScalarValues::Boolean;

    /* couvre les cas d'utilisation lancerNettoyage et programmerNettoyage (EF-01, EF-02, EF-03) */
    action programmerNettoyage {

        // ==========================================
        // 1. ATTRIBUTS (gardes)
        // ==========================================
        attribute cycleMaintenant : Boolean;
        attribute programmerCycle : Boolean;
        attribute annuler : Boolean;

        attribute validerMaintenant : Boolean;
        attribute validerProgrammation : Boolean;
        attribute validerEspaceProgramme : Boolean;

        attribute robotDemarre : Boolean;

        // ==========================================
        // 2. ACTIONS
        // ==========================================
        action ouvrirApplication;

        // Branche "Cycle maintenant"
        action lancerCycleMaintenant;
        action choisirEspaceMaintenant;
        action validerEspaceMaintenant;

        // Branche "Programmer date, heure, durée"
        action programmerDateHeureDuree;
        action programmerDate;
        action programmerHeure;
        action programmerDuree;
        action validerProgrammationCycle;
        action choisirEspaceProgramme;
        action validerEspaceChoisiProgramme;
        action attendreDateChoisie;

        // Fin
        action demarrerRobot;
        action demarrerCycle;
        action signalerEchecDemarrage;

        // ==========================================
        // 3. NOEUDS DE CONTROLE
        // ==========================================
        decide decisionMenu;
        decide decisionValidationMaintenant;
        decide decisionValidationProgrammation;
        decide decisionValidationEspaceProgramme;
        decide decisionDemarrage;

        fork forkProgrammation;
        join joinProgrammation;

        merge mergeDemarrage;

        // ==========================================
        // 4. OUVERTURE DE L'APPLICATION
        // ==========================================
        succession first start then ouvrirApplication;
        succession first ouvrirApplication then decisionMenu;

        // ==========================================
        // 5. CHOIX DANS LE MENU
        // ==========================================
        succession first decisionMenu
            if cycleMaintenant then lancerCycleMaintenant;
        succession first decisionMenu
            if programmerCycle then programmerDateHeureDuree;
        succession first decisionMenu
            if annuler then done;

        // ==========================================
        // 6. BRANCHE "CYCLE MAINTENANT"
        // ==========================================
        succession first lancerCycleMaintenant then choisirEspaceMaintenant;
        succession first choisirEspaceMaintenant then validerEspaceMaintenant;
        succession first validerEspaceMaintenant then decisionValidationMaintenant;

        succession first decisionValidationMaintenant
            if validerMaintenant then mergeDemarrage;
        succession first decisionValidationMaintenant
            if not validerMaintenant then choisirEspaceMaintenant;

        // ==========================================
        // 7. BRANCHE "PROGRAMMER DATE, HEURE, DUREE"
        // ==========================================
        succession first programmerDateHeureDuree then forkProgrammation;

        // Saisies en parallèle
        succession first forkProgrammation then programmerDate;
        succession first forkProgrammation then programmerHeure;
        succession first forkProgrammation then programmerDuree;

        succession first programmerDate then joinProgrammation;
        succession first programmerHeure then joinProgrammation;
        succession first programmerDuree then joinProgrammation;

        succession first joinProgrammation then validerProgrammationCycle;
        succession first validerProgrammationCycle then decisionValidationProgrammation;

        succession first decisionValidationProgrammation
            if validerProgrammation then choisirEspaceProgramme;
        succession first decisionValidationProgrammation
            if not validerProgrammation then programmerDateHeureDuree;

        succession first choisirEspaceProgramme then validerEspaceChoisiProgramme;
        succession first validerEspaceChoisiProgramme then decisionValidationEspaceProgramme;

        succession first decisionValidationEspaceProgramme
            if validerEspaceProgramme then attendreDateChoisie;
        succession first decisionValidationEspaceProgramme
            if not validerEspaceProgramme then choisirEspaceProgramme;

        succession first attendreDateChoisie then mergeDemarrage;

        // ==========================================
        // 8. DEMARRAGE DU ROBOT ET FIN
        // ==========================================
        succession first mergeDemarrage then demarrerRobot;
        succession first demarrerRobot then decisionDemarrage;

        succession first decisionDemarrage
            if robotDemarre then demarrerCycle;
        succession first decisionDemarrage
            if not robotDemarre then signalerEchecDemarrage;

        succession first demarrerCycle then done;
        succession first signalerEchecDemarrage then done;
    }
}
