package AspiCoo_Programmer {

    action fluxProgrammerSession {

        action recevoirParametres;
        action verifierZonesSelectionnees;
        action verifierParametresNettoyage;
        action enregistrerSession;
        action transmettreConfirmation;
        action signalerParametresInvalides;

        merge repriseVerification;

        first debut;

        then action recevoirParametres;
        then action verifierZonesSelectionnees;
        then decide decisionZones;

        if zonesValides then verifierParametresNettoyage;
        if zonesInvalides then signalerParametresInvalides;

        succession signalerParametresInvalides then repriseVerification;
        succession verifierParametresNettoyage then repriseVerification;

        then decide decisionParametres;

        if parametresValides then enregistrerSession;
        if parametresInvalides then signalerParametresInvalides;

        succession enregistrerSession then transmettreConfirmation;

        then done;
    }
}