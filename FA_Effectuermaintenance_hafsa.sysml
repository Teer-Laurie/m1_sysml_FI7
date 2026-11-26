package FluxActionsRAL_Maintenance {

    private import ScalarValues::Boolean;

    /* cas d'utilisation effectuerMaintenance (EF-24, EF-25, EF-28, EF-29) */
    action effectuerMaintenance {

        attribute anomalieDetectee : Boolean;
        attribute guideDemande : Boolean;
        attribute etatRetabli : Boolean;
        attribute nouvelleTentative : Boolean;

        action mesurerEtatComposants;
        action analyserEtatComposants;
        action identifierComposantConcerne;
        action notifierEntretien;
        action afficherGuideEntretien;
        action intervenirSurComposant;   // utilisateur
        action verifierEtatComposants;
        action reinitialiserSuiviUsure;
        action notifierPersistanceAnomalie;

        decide testAnomalie;
        decide testGuide;
        decide testRetablissement;
        decide testNouvelleTentative;

        merge fusionIntervention;
        merge finFlux;

        /* détection en fin de session (EF-24) */
        succession first start then mesurerEtatComposants;
        succession first mesurerEtatComposants then analyserEtatComposants;
        succession first analyserEtatComposants then testAnomalie;
        succession first testAnomalie
            if anomalieDetectee then identifierComposantConcerne;
        succession first testAnomalie
            if not anomalieDetectee then finFlux;

        /* alerte et guide (EF-25, EF-28) */
        succession first identifierComposantConcerne then notifierEntretien;
        succession first notifierEntretien then testGuide;
        succession first testGuide
            if guideDemande then afficherGuideEntretien;
        succession first testGuide
            if not guideDemande then fusionIntervention;
        succession first afficherGuideEntretien then fusionIntervention;

        /* intervention et vérification (EF-29) */
        succession first fusionIntervention then intervenirSurComposant;
        succession first intervenirSurComposant then verifierEtatComposants;
        succession first verifierEtatComposants then testRetablissement;
        succession first testRetablissement
            if etatRetabli then reinitialiserSuiviUsure;
        succession first testRetablissement
            if not etatRetabli then notifierPersistanceAnomalie;

        succession first notifierPersistanceAnomalie then testNouvelleTentative;
        succession first testNouvelleTentative
            if nouvelleTentative then fusionIntervention;
        succession first testNouvelleTentative
            if not nouvelleTentative then finFlux;

        succession first reinitialiserSuiviUsure then finFlux;
        succession first finFlux then done;
    }
}
