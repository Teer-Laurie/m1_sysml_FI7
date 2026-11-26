package FluxActionsRAL {

    private import ScalarValues::Boolean;

    /* cas d'utilisation consulterCarte (EF-03, EF-07, EF-30) */
    action consulterCarte {

        attribute robotConnecte : Boolean;
        attribute modificationDemandee : Boolean;
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
        decide testValidation;

        merge finFlux;

        succession first start then verifierConnexionRobot;
        succession first verifierConnexionRobot then testConnexion;

        succession first testConnexion
            if robotConnecte then recupererCarte;
        succession first testConnexion
            if not robotConnecte then afficherMessageErreur;

        succession first recupererCarte then afficherCarte;
        succession first afficherCarte then testModification;

        succession first testModification
            if modificationDemandee then afficherZonesModifiables;
        succession first testModification
            if not modificationDemandee then finFlux;

        succession first afficherZonesModifiables then testValidation;

        succession first testValidation
            if zonesValidees then enregistrerZones;
        succession first testValidation
            if not zonesValidees then afficherCarte;

        succession first enregistrerZones then afficherConfirmation;
        succession first afficherConfirmation then finFlux;
        succession first afficherMessageErreur then finFlux;

        succession first finFlux then done;
    }
}
