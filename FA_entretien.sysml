package AspiCoo_Entretenir {

    action fluxEntretenirSysteme {

        action recevoirDemandeEntretien;
        action diagnostiquerEtatRobot;
        action verifierReservoirEau;
        action verifierReservoirProduit;
        action verifierEtatAccessoires;
        action verifierEtatStation;
        action verifierEtatSachet;
        action identifierOperationsEntretien;
        action signalerBesoinRemplissage;
        action signalerBesoinNettoyage;
        action signalerSachetPlein;
        action recevoirConfirmationEntretien;
        action actualiserEtatSysteme;
        action terminerDiagnostic;

        merge fusionDiagnostic;
        merge fusionEntretien;

        first debut;

        then action recevoirDemandeEntretien;
        then action diagnostiquerEtatRobot;

        then action verifierReservoirEau;
        then action verifierReservoirProduit;
        then action verifierEtatAccessoires;
        then action verifierEtatStation;
        then action verifierEtatSachet;

        then action identifierOperationsEntretien;

        then decide decisionEntretien;

        if remplissageNecessaire then signalerBesoinRemplissage;
        if nettoyageNecessaire then signalerBesoinNettoyage;
        if sachetPlein then signalerSachetPlein;
        if entretienNonNecessaire then fusionEntretien;

        succession signalerBesoinRemplissage then fusionDiagnostic;
        succession signalerBesoinNettoyage then fusionDiagnostic;
        succession signalerSachetPlein then fusionDiagnostic;

        succession fusionDiagnostic then recevoirConfirmationEntretien;

        then action actualiserEtatSysteme;
        then action terminerDiagnostic;

        then done;
    }
}