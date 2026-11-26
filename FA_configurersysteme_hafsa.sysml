package FluxActionsRAL_Configuration {

    private import ScalarValues::Boolean;

    /* cas d'utilisation configurerSysteme (EF-04, EF-05, EF-26) */
    action configurerSysteme {

        // ===== 1. ATTRIBUTS (gardes) =====
        attribute wifiConnecte : Boolean;
        attribute reessayerWifi : Boolean;
        attribute scanQRCode : Boolean;
        attribute identificationCorrecte : Boolean;
        attribute compteCree : Boolean;
        attribute boutonCartographier : Boolean;
        attribute espaceCartographie : Boolean;
        attribute recommencerCartographie : Boolean;
        attribute donneesEnvoyees : Boolean;
        attribute renvoyerDonnees : Boolean;

        // ===== 2. ACTIONS =====
        action installerApplicationSmartphone;
        action connecterRobotWifi;
        action messageAlerte;
        action connecterRobotApplication;

        action scannerQRCodeIdentification;
        action saisirManuellementIdentifiantRobot;
        action creerCompteIdentification;
        action accederMenuApplication;

        action choisirParametresApplication;
        action fermerApplication;

        action demarrerRobot;
        action choisirOptionCartographie;
        action lancerRobot;
        action cartographierEspace;
        action enregistrerDonnees;

        action envoyerDonneesApplication;
        action messageErreur;
        action verifierValiderDonneesUtilisateur;
        action enregistrementFinal;

        // ===== 3. NOEUDS DE CONTROLE =====
        decide decisionConnexion;
        decide decisionReessayerWifi;
        decide decisionModeIdentification;
        decide decisionIdentification;
        decide decisionCompte;
        decide decisionMenu;
        decide decisionCartographie;
        decide decisionRecommencerCartographie;
        decide decisionTransmission;
        decide decisionErreurTransmission;

        merge mergeIdentification;
        merge finFlux;

        // ===== 4. INSTALLATION ET CONNEXION WI-FI =====
        succession first start then installerApplicationSmartphone;
        succession first installerApplicationSmartphone then connecterRobotWifi;
        succession first connecterRobotWifi then decisionConnexion;

        succession first decisionConnexion
            if wifiConnecte then connecterRobotApplication;
        succession first decisionConnexion
            if not wifiConnecte then messageAlerte;

        succession first messageAlerte then decisionReessayerWifi;
        succession first decisionReessayerWifi
            if reessayerWifi then connecterRobotWifi;
        succession first decisionReessayerWifi
            if not reessayerWifi then finFlux;

        // ===== 5. IDENTIFICATION DU ROBOT (appairage) =====
        succession first connecterRobotApplication then decisionModeIdentification;

        succession first decisionModeIdentification
            if scanQRCode then scannerQRCodeIdentification;
        succession first decisionModeIdentification
            if not scanQRCode then saisirManuellementIdentifiantRobot;

        succession first scannerQRCodeIdentification then mergeIdentification;
        succession first saisirManuellementIdentifiantRobot then mergeIdentification;
        succession first mergeIdentification then decisionIdentification;

        succession first decisionIdentification
            if identificationCorrecte then creerCompteIdentification;
        succession first decisionIdentification
            if not identificationCorrecte then connecterRobotApplication;

        // ===== 6. CREATION DU COMPTE =====
        succession first creerCompteIdentification then decisionCompte;

        succession first decisionCompte
            if compteCree then accederMenuApplication;
        succession first decisionCompte
            if not compteCree then creerCompteIdentification;

        // ===== 7. CHOIX DANS LE MENU =====
        succession first accederMenuApplication then decisionMenu;

        succession first decisionMenu
            if boutonCartographier then demarrerRobot;
        succession first decisionMenu
            if not boutonCartographier then choisirParametresApplication;

        succession first choisirParametresApplication then fermerApplication;
        succession first fermerApplication then finFlux;

        // ===== 8. CARTOGRAPHIE =====
        succession first demarrerRobot then choisirOptionCartographie;
        succession first choisirOptionCartographie then lancerRobot;
        succession first lancerRobot then cartographierEspace;
        succession first cartographierEspace then decisionCartographie;

        succession first decisionCartographie
            if espaceCartographie then enregistrerDonnees;
        succession first decisionCartographie
            if not espaceCartographie then decisionRecommencerCartographie;

        succession first decisionRecommencerCartographie
            if recommencerCartographie then cartographierEspace;
        succession first decisionRecommencerCartographie
            if not recommencerCartographie then finFlux;

        // ===== 9. ENREGISTREMENT ET ENVOI =====
        succession first enregistrerDonnees then envoyerDonneesApplication;
        succession first envoyerDonneesApplication then decisionTransmission;

        succession first decisionTransmission
            if donneesEnvoyees then verifierValiderDonneesUtilisateur;
        succession first decisionTransmission
            if not donneesEnvoyees then messageErreur;

        succession first messageErreur then decisionErreurTransmission;
        succession first decisionErreurTransmission
            if renvoyerDonnees then envoyerDonneesApplication;
        succession first decisionErreurTransmission
            if not renvoyerDonnees then finFlux;

        // ===== 10. VALIDATION ET FIN =====
        succession first verifierValiderDonneesUtilisateur then enregistrementFinal;
        succession first enregistrementFinal then finFlux;

        succession first finFlux then done;
    }
}
