package robot {
    action configurerSysteme {
        private import ScalarValues::Boolean;

        attribute robotConnecte : Boolean;
        attribute robotNonConnecte : Boolean;
        attribute scanQRCode : Boolean;
        attribute saisieManuelle : Boolean;
        attribute identifiantCorrect : Boolean;
        attribute identifiantIncorrect : Boolean;
        attribute compteCree : Boolean;
        attribute compteNonCree : Boolean;

        action installerApplication;
        action connecterRobotWifi;
        action afficherMessageAlerte;
        action connecterRobotApplication;
        action scannerQRCode;
        action saisirIdentifiantManuellement;
        action creerCompteIdentification;
        action choisirParametres;

        action finAlerte;
        action finConfiguration;

        decide decideWifi;
        decide decideMethode;
        decide decideQR;
        decide decideIdentifiant;
        decide decideCompte;

        merge mergeConnexion;
        merge mergeIdentifiant;
        merge mergeCompte;

        first start;
        then installerApplication;
        then connecterRobotWifi;
        then decideWifi;
            if robotNonConnecte then afficherMessageAlerte;
            if robotConnecte then mergeConnexion;

        succession afficherMessageAlerte then finAlerte;

        succession mergeConnexion then connecterRobotApplication;
        then decideMethode;
            if scanQRCode then scannerQRCode;
            if saisieManuelle then saisirIdentifiantManuellement;

        succession scannerQRCode then decideQR;
            if identifiantIncorrect then mergeConnexion;
            if identifiantCorrect then mergeIdentifiant;

        succession saisirIdentifiantManuellement then mergeIdentifiant;
        succession mergeIdentifiant then decideIdentifiant;
            if identifiantIncorrect then mergeConnexion;
            if identifiantCorrect then mergeCompte;

        succession mergeCompte then creerCompteIdentification;
        then decideCompte;
            if compteNonCree then mergeCompte;
            if compteCree then choisirParametres;

        succession choisirParametres then finConfiguration;
    }
}
