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
        succession demarrerRobot if robotDemarre then choisirOptionCartographier;
        succession choisirOptionCartographier if optionChoisie then lancerRobot;
        succession lancerRobot if robotLance then mergeCartographie;

        succession mergeCartographie then cartographierEspace;
        then decideCartographie;
            if espaceCartographie then enregistrerDonnees;
            if espaceNonCartographie then decideRecommencerCartographie;

        succession decideRecommencerCartographie
            if recommencerCartographie then mergeCartographie;
        succession decideRecommencerCartographie
            if annulerCartographie then done;

        succession enregistrerDonnees if donneesEnregistrees then mergeEnvoi;

        succession mergeEnvoi then envoyerDonneesApplication;
        then decideEnvoi;
            if donneesEnvoyees then verifierValiderDonnees;
            if donneesNonEnvoyees then afficherMessageErreur;

        succession afficherMessageErreur then decideRecommencerEnvoi;
            if recommencerEnvoi then mergeEnvoi;
            if annulerEnvoi then done;

        succession verifierValiderDonnees if donneesValidees then enregistrementFinal;
        succession enregistrementFinal then done;
    }
}
