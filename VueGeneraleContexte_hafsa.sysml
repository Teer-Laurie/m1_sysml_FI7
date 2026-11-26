package RobotAspirateurLaveur {

    package Parts {
        /* acteur */
        part def Utilisateur;

        /* constituants du système */
        part def RobotNettoyeur;
        part def StationRechargeEvacuation;
        part def ApplicationMobile;

        part def SystemeRAL {
            part robot : RobotNettoyeur;
            part station : StationRechargeEvacuation;
            part application : ApplicationMobile;

            /* échanges internes au système */
            flow recharge from station to robot;
            flow transfereDechets from robot to station;
        }

        /* éléments externes */
        part def ReseauWifi;
        part def ReseauElectrique;
        part def Sol;
        part def Obstacle;
        part def Salete;
    }

    package VueContexte {
        private import Parts::*;

        part def Contexte {
            part utilisateur : Utilisateur[1..*];
            part systeme : SystemeRAL;
            part wifi : ReseauWifi;
            part reseauElectrique : ReseauElectrique;
            part sol : Sol;
            part obstacle : Obstacle[0..*];
            part salete : Salete[0..*];

            /* utilisateur -> système */
            flow lance from utilisateur to systeme.application;
            flow appuieBouton from utilisateur to systeme.robot;
            flow remplit from utilisateur to systeme.station;

            /* système -> utilisateur */
            flow notifie from systeme.application to utilisateur;
            flow fournitSachet from systeme.station to utilisateur;

            /* communication par le Wi-Fi */
            flow envoieCommande from systeme.application to wifi;
            flow transmetCommande from wifi to systeme.robot;
            flow envoieEtat from systeme.robot to wifi;
            flow transmetEtat from wifi to systeme.application;

            /* énergie */
            flow alimente from reseauElectrique to systeme.station;
            connect systeme.station to reseauElectrique;

            /* environnement */
            flow signale from obstacle to systeme.robot;
            flow estCollectee from salete to systeme.robot;
            flow nettoie from systeme.robot to sol;
        }
    }
}
