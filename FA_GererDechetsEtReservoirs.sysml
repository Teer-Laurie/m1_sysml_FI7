package FluxActionsRAL {
    action gererDechetsEtReservoirs {
        private import ScalarValues::Boolean;

        attribute dechetsCollectes : Boolean;
        attribute robotAccoste : Boolean;
        attribute sachetPresent : Boolean;
        attribute sachetAbsent : Boolean;
        attribute sachetPlace : Boolean;
        attribute sachetPlein : Boolean;
        attribute sachetNonPlein : Boolean;
        attribute niveauLiquideBas : Boolean;
        attribute niveauLiquideSuffisant : Boolean;
        attribute reservoirsRemplis : Boolean;

        action compacterDechets;
        action verifierPresenceSachet;
        action notifierSachetAbsent;
        action transfererDechets;
        action mesurerNiveauSachet;
        action notifierSachetPlein;
        action mesurerNiveauxLiquides;
        action notifierNiveauLiquideBas;
        decide testPresence;
        decide testSachet;
        decide testLiquides;
        merge fusionPresence;
        merge fusionSachet;

        first start;
        succession first start if dechetsCollectes then compacterDechets;
        succession first compacterDechets if robotAccoste then verifierPresenceSachet;
        then testPresence;
            if sachetPresent then fusionPresence;
            if sachetAbsent then notifierSachetAbsent;
        succession first notifierSachetAbsent if sachetPlace then fusionPresence;
        first fusionPresence then transfererDechets;
        then mesurerNiveauSachet;
        then testSachet;
            if sachetPlein then notifierSachetPlein;
            if sachetNonPlein then fusionSachet;
        first notifierSachetPlein then fusionSachet;
        first fusionSachet then mesurerNiveauxLiquides;
        then testLiquides;
            if niveauLiquideBas then notifierNiveauLiquideBas;
            if niveauLiquideSuffisant then done;
        succession first notifierNiveauLiquideBas if reservoirsRemplis then done;
    }
}