package FluxActionsRAL_Dechets {

    private import ScalarValues::Boolean;

    /* cas d'utilisation gererDechetsEtReservoirs (EF-19 à EF-23, EF-27, EF-31, EF-32) */
    action gererDechetsEtReservoirs {

        attribute robotAccoste : Boolean;
        attribute sachetPresent : Boolean;
        attribute sachetPlein : Boolean;
        attribute niveauLiquideBas : Boolean;

        action compacterDechets;
        action attendreAccostage;
        action verifierPresenceSachet;
        action notifierSachetAbsent;
        action placerSachet;            // utilisateur
        action transfererDechets;
        action mesurerNiveauSachet;
        action notifierSachetPlein;
        action retirerSachetPlein;      // utilisateur
        action mesurerNiveauxLiquides;
        action notifierNiveauLiquideBas;
        action remplirReservoirs;       // utilisateur

        decide testAccostage;
        decide testPresence;
        decide testSachet;
        decide testLiquides;

        merge fusionAccostage;
        merge fusionPresence;
        merge fusionSachet;
        merge finFlux;

        /* compactage puis retour à la station */
        succession first start then compacterDechets;
        succession first compacterDechets then fusionAccostage;
        succession first fusionAccostage then testAccostage;
        succession first testAccostage
            if robotAccoste then verifierPresenceSachet;
        succession first testAccostage
            if not robotAccoste then attendreAccostage;
        succession first attendreAccostage then fusionAccostage;

        /* présence du sachet (EF-27) */
        succession first verifierPresenceSachet then testPresence;
        succession first testPresence
            if sachetPresent then fusionPresence;
        succession first testPresence
            if not sachetPresent then notifierSachetAbsent;
        succession first notifierSachetAbsent then placerSachet;
        succession first placerSachet then verifierPresenceSachet;

        /* transfert et remplissage du sachet (EF-20, EF-21, EF-31) */
        succession first fusionPresence then transfererDechets;
        succession first transfererDechets then mesurerNiveauSachet;
        succession first mesurerNiveauSachet then testSachet;
        succession first testSachet
            if sachetPlein then notifierSachetPlein;
        succession first testSachet
            if not sachetPlein then fusionSachet;
        succession first notifierSachetPlein then retirerSachetPlein;
        succession first retirerSachetPlein then fusionSachet;

        /* niveaux d'eau et de produit (EF-23, EF-32) */
        succession first fusionSachet then mesurerNiveauxLiquides;
        succession first mesurerNiveauxLiquides then testLiquides;
        succession first testLiquides
            if niveauLiquideBas then notifierNiveauLiquideBas;
        succession first testLiquides
            if not niveauLiquideBas then finFlux;
        succession first notifierNiveauLiquideBas then remplirReservoirs;
        succession first remplirReservoirs then mesurerNiveauxLiquides;

        succession first finFlux then done;
    }
}
