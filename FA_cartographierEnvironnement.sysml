package robot {
    action cartographierEnvironnement {
        private import ScalarValues::Boolean;

        attribute robotDemarre : Boolean;
        attribute optionChoisie : Boolean;
        attribute robotLance : Boolean;
        attribute espaceCartographie : Boolean;
        attribute espaceNonCartographie : Boolean;
        attribute recommencerCartographie : Boolean;
        attribute annulerCartographie : Boolean;
        attribute donneesEnregistrees : Boolean;
        attribute donneesEnvoyees : Boolean;
        attribute donneesNonEnvoyees : Boolean;
        attribute recommencerEnvoi : Boolean;
        attribute annulerEnvoi : Boolean;
        attribute donneesValidees : Boolean;

        action demarrerRobot;
        action choisirOptionCartographier;
        action lancerRobot;
        action cartographierEspace;
        action enregistrerDonnees;
        action envoyerDonneesApplication;
        action afficherMessageErreur;
        action verifierValiderDonnees;
        action enregistrementFinal;


        decide decideCartographie;
        decide decideRecommencerCartographie;
        decide decideEnvoi;
        decide decideRecommencerEnvoi;

        merge mergeCartographie;
        merge mergeEnvoi;

        first start;
        then demarrerRobot;
        succession first demarrerRobot if robotDemarre then choisirOptionCartographier;
        succession first choisirOptionCartographier if optionChoisie then lancerRobot;
        succession first lancerRobot if robotLance then mergeCartographie;

        succession first mergeCartographie then cartographierEspace;
        then decideCartographie;
            if espaceCartographie then enregistrerDonnees;
            if espaceNonCartographie then decideRecommencerCartographie;

        succession first decideRecommencerCartographie
            if recommencerCartographie then mergeCartographie;
        succession first decideRecommencerCartographie
            if annulerCartographie then done;

        succession first enregistrerDonnees if donneesEnregistrees then mergeEnvoi;

        succession first mergeEnvoi then envoyerDonneesApplication;
        then decideEnvoi;
            if donneesEnvoyees then verifierValiderDonnees;
            if donneesNonEnvoyees then afficherMessageErreur;

        succession first afficherMessageErreur then decideRecommencerEnvoi;
            if recommencerEnvoi then mergeEnvoi;
            if annulerEnvoi then done;

        succession first verifierValiderDonnees if donneesValidees then enregistrementFinal;
        succession first enregistrementFinal then done;
    }
}
