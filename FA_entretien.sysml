package AspiCoo_Entretenir {

    action fluxEntretenirSysteme {

<<<<<<< HEAD
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
=======
        action lancerProcessusEntretien;
        action controlerEtatRobot;
        action controlerNiveauDesReservoirs;
        action signalerBesoinRemplissageEau;
        action signalerBesoinRemplissageProduit;
        action signalerNettoyageAccessoires;
        action controlerEtatStation;
        action controlerEtatSachet;
        action signalerRetraitSachetPlein;
        action activerDisponibiliteSachetSuivant;
        action terminerProcessusEntretien;

        merge choixReservoirs;
>>>>>>> d2feea2ad4e2a39edf5d7f33543feb9573e4d938

        first debut;

<<<<<<< HEAD
        then action recevoirDemandeEntretien;
        then action diagnostiquerEtatRobot;
=======
        then lancerProcessusEntretien;
        then controlerEtatRobot;
        then controlerNiveauDesReservoirs;
>>>>>>> d2feea2ad4e2a39edf5d7f33543feb9573e4d938

        then action verifierReservoirEau;
        then action verifierReservoirProduit;
        then action verifierEtatAccessoires;
        then action verifierEtatStation;
        then action verifierEtatSachet;

<<<<<<< HEAD
        then action identifierOperationsEntretien;

        then decide decisionEntretien;

        if remplissageNecessaire then signalerBesoinRemplissage;
        if nettoyageNecessaire then signalerBesoinNettoyage;
        if sachetPlein then signalerSachetPlein;
        if entretienNonNecessaire then fusionEntretien;
=======
        if eauNecessaire then signalerBesoinRemplissageEau;
        if produitNecessaire then signalerBesoinRemplissageProduit;

        succession signalerBesoinRemplissageEau then choixReservoirs;
        succession signalerBesoinRemplissageProduit then choixReservoirs;

        then signalerNettoyageAccessoires;
        then controlerEtatStation;
        then controlerEtatSachet;
>>>>>>> d2feea2ad4e2a39edf5d7f33543feb9573e4d938

        succession signalerBesoinRemplissage then fusionDiagnostic;
        succession signalerBesoinNettoyage then fusionDiagnostic;
        succession signalerSachetPlein then fusionDiagnostic;

<<<<<<< HEAD
        succession fusionDiagnostic then recevoirConfirmationEntretien;

        then action actualiserEtatSysteme;
        then action terminerDiagnostic;
=======
        if sachetPlein then signalerRetraitSachetPlein;
        if sachetNonPlein then terminerProcessusEntretien;

        succession signalerRetraitSachetPlein then activerDisponibiliteSachetSuivant;
        succession activerDisponibiliteSachetSuivant then terminerProcessusEntretien;
>>>>>>> d2feea2ad4e2a39edf5d7f33543feb9573e4d938

        then done;
    }
}