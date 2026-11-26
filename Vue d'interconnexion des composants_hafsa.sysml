package RAL_VueInterconnexion {

    private import RAL_VueGenerale::Parts::*;

    part systemeRAL : SystemeRAL {

        /* --- dans le robot --- */
        /* perception -> contrôleur */
        flow obstacles from robot.capteursObstacles to robot.controleur;
        flow typeSurface from robot.capteurSurface to robot.controleur;
        flow niveauSalete from robot.capteurSalete to robot.controleur;
        flow carte from robot.cartographie to robot.controleur;
        flow etatComposants from robot.diagnostic to robot.controleur;
        flow commandeLocale from robot.bouton to robot.controleur;

        /* contrôleur -> actionneurs */
        flow consigneDeplacement from robot.controleur to robot.moteurs;
        flow puissanceAspiration from robot.controleur to robot.aspirateur;
        flow consigneLavage from robot.controleur to robot.lavage;

        /* chaîne des déchets */
        flow dechets from robot.aspirateur to robot.reservoir;
        flow compactage from robot.compacteur to robot.reservoir;

        /* surveillance de l'usure */
        flow etatBrosse from robot.brosse to robot.diagnostic;
        flow etatFiltre from robot.filtre to robot.diagnostic;

        /* énergie */
        flow energie from robot.batterie to robot.controleur;

        /* communication */
        flow donneesRobot from robot.controleur to robot.wifi;

        /* --- dans la station --- */
        flow energieStation from station.alimentation to station.chargeur;
        flow niveauSachet from station.capteurSachet to station.evacuation;
        flow dechetsVersSachet from station.evacuation to station.sachets;
        flow niveauEau from station.reservoirEau to station.capteursLiquides;
        flow niveauProduit from station.reservoirProduit to station.capteursLiquides;

        /* --- entre le robot et la station --- */
        flow recharge from station.chargeur to robot.batterie;
        flow evacuationDechets from robot.reservoir to station.evacuation;
        flow eau from station.reservoirEau to robot.lavage;
        flow produit from station.reservoirProduit to robot.lavage;

        /* --- entre le robot et l'application (par le Wi-Fi) --- */
        flow commandes from application.programmation to robot.wifi;
        flow etatRobot from robot.wifi to application.notifications;
        flow carteRobot from robot.wifi to application.carte;
    }
}
