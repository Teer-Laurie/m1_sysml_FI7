package FluxActionsRAL {
    action consulterCarte {
        private import ScalarValues::Boolean;

        attribute demandeCarte : Boolean;
        attribute robotConnecte : Boolean;
        attribute robotHorsLigne : Boolean;
        attribute modificationDemandee : Boolean;
        attribute aucuneModification : Boolean;
        attribute zonesValidees : Boolean;

        action verifierConnexionRobot;
        action recupererCarte;
        action afficherCarte;
        action afficherMessageErreur;
        action afficherZonesModifiables;
        action enregistrerZones;
        action afficherConfirmation;
        decide testConnexion;
        decide testModification;

        first start;
        succession first start if demandeCarte then verifierConnexionRobot;
        then testConnexion;
            if robotConnecte then recupererCarte;
            if robotHorsLigne then afficherMessageErreur;
        succession first recupererCarte then afficherCarte;
        then testModification;
            if modificationDemandee then afficherZonesModifiables;
            if aucuneModification then done;
        succession first afficherZonesModifiables if zonesValidees then enregistrerZones;
        then afficherConfirmation;
        then done;
        succession first afficherMessageErreur then done;
    }
}