package AspiCoo_Entretenir {

    action vueEntretenirSysteme {

        action commencerEntretien;
        action verifierEtatRobot;
        action verifierReservoirs;
        action remplirEau;
        action remplirProduit;
        action nettoyerAccessoires;
        action verifierStation;
        action verifierSachet;
        action retirerSachetPlein;
        action rendreSachetSuivantDisponible;
        action terminerEntretien;

        merge choixReservoirs;
        merge choixSachet;

        first start;

        then commencerEntretien;
        then verifierEtatRobot;
        then verifierReservoirs;

        then decide decision0;

        if eauNecessaire then remplirEau;
        if produitNecessaire then remplirProduit;

        succession remplirEau then choixReservoirs;
        succession remplirProduit then choixReservoirs;

        then nettoyerAccessoires;
        then verifierStation;
        then verifierSachet;

        then decide decision1;

        if sachetPlein then retirerSachetPlein;
        if sachetNonPlein then terminerEntretien;

        succession retirerSachetPlein then rendreSachetSuivantDisponible;
        succession rendreSachetSuivantDisponible then terminerEntretien;

        then done;
    }
}