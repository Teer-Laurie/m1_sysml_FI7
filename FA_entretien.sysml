package AspiCoo_Entretenir {

    action vueEntretenirSysteme {

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
        merge choixSachet;

        first start;

        then lancerProcessusEntretien;
        then controlerEtatRobot;
        then controlerNiveauDesReservoirs;

        then decide decision0;

        if eauNecessaire then signalerBesoinRemplissageEau;
        if produitNecessaire then signalerBesoinRemplissageProduit;

        succession signalerBesoinRemplissageEau then choixReservoirs;
        succession signalerBesoinRemplissageProduit then choixReservoirs;

        then signalerNettoyageAccessoires;
        then controlerEtatStation;
        then controlerEtatSachet;

        then decide decision1;

        if sachetPlein then signalerRetraitSachetPlein;
        if sachetNonPlein then terminerProcessusEntretien;

        succession signalerRetraitSachetPlein then activerDisponibiliteSachetSuivant;
        succession activerDisponibiliteSachetSuivant then terminerProcessusEntretien;

        then done;
    }
}