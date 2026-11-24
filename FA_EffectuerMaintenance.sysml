package FluxActionsRAL {
    action effectuerMaintenance {
        private import ScalarValues::Boolean;

        attribute sessionTerminee : Boolean;
        attribute anomalieDetectee : Boolean;
        attribute aucuneAnomalie : Boolean;
        attribute guideDemande : Boolean;
        attribute interventionEffectuee : Boolean;
        attribute etatRetabli : Boolean;
        attribute etatNonRetabli : Boolean;

        action mesurerEtatComposants;
        action analyserEtatComposants;
        action identifierComposantConcerne;
        action notifierEntretien;
        action afficherGuideEntretien;
        action verifierEtatComposants;
        action reinitialiserSuiviUsure;
        action notifierPersistanceAnomalie;
        decide testAnomalie;
        decide testRetablissement;

        first start;
        succession first start if sessionTerminee then mesurerEtatComposants;
        then analyserEtatComposants;
        then testAnomalie;
            if anomalieDetectee then identifierComposantConcerne;
            if aucuneAnomalie then done;
        first identifierComposantConcerne then notifierEntretien;
        succession first notifierEntretien if guideDemande then afficherGuideEntretien;
        succession first afficherGuideEntretien if interventionEffectuee then verifierEtatComposants;
        then testRetablissement;
            if etatRetabli then reinitialiserSuiviUsure;
            if etatNonRetabli then notifierPersistanceAnomalie;
        first reinitialiserSuiviUsure then done;
        first notifierPersistanceAnomalie then done;
    }
}