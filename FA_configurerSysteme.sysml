
package tbi {

    private import ScalarValues::Boolean;

    action configurerSysteme {

        // ==========================================
        // 1. ATTRIBUTS
        // ==========================================

        attribute wifiConnecte : Boolean;
        attribute wifiNonConnecte : Boolean;

        attribute scanQRCode : Boolean;
        attribute identificationManuelle : Boolean;
        attribute identificationCorrecte : Boolean;
        attribute identificationIncorrecte : Boolean;

        attribute compteCree : Boolean;
        attribute compteNonCree : Boolean;

        attribute boutonCartographierEnvironnement : Boolean;
        attribute boutonConfigurerParametres : Boolean;

        attribute robotDemarre : Boolean;
        attribute optionChoisie : Boolean;

        attribute espaceCartographie : Boolean;
        attribute espaceNonCartographie : Boolean;

        attribute recommencer : Boolean;
        attribute annulation : Boolean;

        attribute donneesEnregistrees : Boolean;
        attribute donneesEnvoyees : Boolean;
        attribute donneesNonEnvoyees : Boolean;
        attribute donneesValidees : Boolean;


        // ==========================================
        // 2. ACTIONS
        // ==========================================

        // Configuration du système
        action installerApplicationSmartphone;
        action connecterRobotWifi;
        action messageAlerte;
        action connecterRobotApplication;

        // Identification
        action scannerQRCodeIdentification;
        action saisirManuellementIdentifiantRobot;
        action creerCompteIdentification;
        action accederMenuApplication;

        // Configuration des paramètres
        action choisirParametresApplication;
        action fermerApplication;

        // Cartographie de l'environnement
        action demarrerRobot;
        action choisirOptionCartographie;
        action lancerRobot;
        action cartographierEspace;
        action enregistrerDonnees;

        // Transmission et validation
        action envoyerDonneesApplication;
        action messageErreur;
        action verifierValiderDonneesUtilisateur;
        action enregistrementFinal;


        // ==========================================
        // 3. DECISIONS INDIVIDUELLES
        // ==========================================

        decide decisionConnexion;
        decide decisionModeIdentification;
        decide decisionIdentification;
        decide decisionCompte;
        decide decisionMenuApplication;

        decide decisionCartographie;
        decide decisionRecommencerCartographie;

        decide decisionTransmission;
        decide decisionErreurTransmission;


        // ==========================================
        // 4. MERGE INDIVIDUEL
        // ==========================================

        merge mergeIdentification;


        // ==========================================
        // 5. INSTALLATION ET CONNEXION
        // ==========================================

        first start;

        succession start then installerApplicationSmartphone;
        then connecterRobotWifi;
        then decisionConnexion;

        if wifiNonConnecte then messageAlerte;
        if wifiConnecte then connecterRobotApplication;

        succession messageAlerte then done;


        // ==========================================
        // 6. IDENTIFICATION DU ROBOT
        // ==========================================

        succession connecterRobotApplication
            then decisionModeIdentification;

        if scanQRCode then scannerQRCodeIdentification;
        if identificationManuelle then saisirManuellementIdentifiantRobot;

        succession scannerQRCodeIdentification
            then mergeIdentification;

        succession mergeIdentification
            then decisionIdentification;

        succession saisirManuellementIdentifiantRobot
            then decisionIdentification;

        if identificationIncorrecte
            then connecterRobotApplication;

        if identificationCorrecte
            then creerCompteIdentification;


        // ==========================================
        // 7. CREATION DU COMPTE
        // ==========================================

        succession creerCompteIdentification
            then decisionCompte;

        if compteNonCree
            then creerCompteIdentification;

        if compteCree
            then accederMenuApplication;


        // ==========================================
        // 8. CHOIX DANS LE MENU
        // ==========================================

        succession accederMenuApplication
            then decisionMenuApplication;

        if boutonCartographierEnvironnement
            then demarrerRobot;

        if boutonConfigurerParametres
            then choisirParametresApplication;

        succession choisirParametresApplication
            then fermerApplication;

        succession fermerApplication then done;


        // ==========================================
        // 9. DEMARRAGE DU ROBOT
        // ==========================================

        succession demarrerRobot
            then choisirOptionCartographie;

        then lancerRobot;

        then cartographierEspace;


        // ==========================================
        // 10. VERIFICATION DE LA CARTOGRAPHIE
        // ==========================================

        succession cartographierEspace
            then decisionCartographie;

        if espaceNonCartographie
            then decisionRecommencerCartographie;
            
        if annulation
            then done;

        if espaceCartographie
            then enregistrerDonnees;


        // ==========================================
        // 11. RECOMMENCER OU ANNULER
        // ==========================================

        if recommencer
            then cartographierEspace;




        // ==========================================
        // 12. ENREGISTREMENT ET ENVOI
        // ==========================================

        succession enregistrerDonnees
            then envoyerDonneesApplication;

        then decisionTransmission;

        if donneesEnvoyees
            then verifierValiderDonneesUtilisateur;

        if donneesNonEnvoyees
            then messageErreur;


        // ==========================================
        // 13. GESTION DU MESSAGE D'ERREUR
        // ==========================================

        succession messageErreur
            then decisionErreurTransmission;

        if recommencer
            then envoyerDonneesApplication;

        if annulation
            then done;


        // ==========================================
        // 14. VALIDATION ET FIN
        // ==========================================

        succession verifierValiderDonneesUtilisateur
            then enregistrementFinal;

        succession enregistrementFinal then done;

    }
}
