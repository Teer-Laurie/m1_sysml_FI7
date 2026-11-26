package tbi {

    private import ScalarValues::Boolean;

    action programmerNettoyage {

        // ==========================================
        // 1. ATTRIBUTS (gardes)
        // ==========================================

        attribute menuApplication : Boolean;
        attribute cycleMaintenant : Boolean;
        attribute programmerCycle : Boolean;

        attribute espaceChoisiMaintenant : Boolean;
        attribute validerMaintenant : Boolean;
        attribute robotDemarreMaintenant : Boolean;

        attribute validerProgrammation : Boolean;
        attribute espaceChoisiProgramme : Boolean;
        attribute validerEspaceProgramme : Boolean;
        attribute robotDemarreProgramme : Boolean;

        attribute cycleDemarre : Boolean;


        // ==========================================
        // 2. ACTIONS
        // ==========================================

        // Ouverture
        action ouvrirApplication;

        // Branche "Cycle maintenant"
        action lancerCycleMaintenant;
        action choisirEspaceMaintenant;
        action validerEspaceMaintenant;
        action demarrerRobotMaintenant;

        // Branche "Programmer date, heure, duree"
        action programmerDateHeureDuree;
        action programmerDate;
        action programmerHeure;
        action programmerDuree;
        action validerProgrammationCycle;
        action choisirEspaceProgramme;
        action validerEspaceChoisiProgramme;
        action attendreDateChoisie;
        action demarrerRobotProgramme;

        // Fin
        action demarrerCycle;


        // ==========================================
        // 3. DECISIONS, FORK, JOIN ET MERGE
        // ==========================================

        decide decisionMenuApplication;

        fork forkProgrammation;
        join joinProgrammation;

        merge mergeDemarrage;


        // ==========================================
        // 4. OUVERTURE DE L'APPLICATION
        // ==========================================

        first start;

        succession first start then ouvrirApplication;

        succession first ouvrirApplication
            then decisionMenuApplication;


        // ==========================================
        // 5. CHOIX DANS LE MENU
        // ==========================================

        if cycleMaintenant then lancerCycleMaintenant;
        if programmerCycle then programmerDateHeureDuree;


        // ==========================================
        // 6. BRANCHE "CYCLE MAINTENANT"
        // ==========================================

        succession first lancerCycleMaintenant
            then choisirEspaceMaintenant;

        succession first choisirEspaceMaintenant
            if espaceChoisiMaintenant then validerEspaceMaintenant;

        succession first validerEspaceMaintenant
            if validerMaintenant then demarrerRobotMaintenant;

        succession first demarrerRobotMaintenant
            if robotDemarreMaintenant then mergeDemarrage;


        // ==========================================
        // 7. BRANCHE "PROGRAMMER DATE, HEURE, DUREE"
        // ==========================================

        succession first programmerDateHeureDuree
            then forkProgrammation;

        // Saisies en parallele
        succession first forkProgrammation then programmerDate;
        succession first forkProgrammation then programmerHeure;
        succession first forkProgrammation then programmerDuree;

        succession first programmerDate then joinProgrammation;
        succession first programmerHeure then joinProgrammation;
        succession first programmerDuree then joinProgrammation;

        succession first joinProgrammation
            then validerProgrammationCycle;

        succession first validerProgrammationCycle
            if validerProgrammation then choisirEspaceProgramme;

        succession first choisirEspaceProgramme
            if espaceChoisiProgramme then validerEspaceChoisiProgramme;

        succession first validerEspaceChoisiProgramme
            if validerEspaceProgramme then attendreDateChoisie;

        succession first attendreDateChoisie
            then demarrerRobotProgramme;

        succession first demarrerRobotProgramme
            if robotDemarreProgramme then mergeDemarrage;


        // ==========================================
        // 8. DEMARRAGE DU CYCLE ET FIN
        // ==========================================

        succession first mergeDemarrage
            then demarrerCycle;

        succession first demarrerCycle
            if cycleDemarre then done;

    }
}