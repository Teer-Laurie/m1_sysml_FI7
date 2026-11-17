package RobotAspirateurLaveur {

    package Parts {
        /* Acteur */
        part def Utilisateur;

        /* Constituants du système */
        part def RobotAspirateurLaveur;
        part def StationDeRecharge;
        part def ApplicationMobile;

        /* Éléments externes */
        part def ReseauWifi;
        part def ReseauElectrique;
        part def Sol;
        part def Obstacle;
        part def Salete;
    }

    package Contexte {
        private import Parts::*;

        part def Contexte {
            part utilisateur : Utilisateur;
            part robot : RobotAspirateurLaveur;
            part station : StationDeRecharge;
            part application : ApplicationMobile;
            part wifi : ReseauWifi;
            part reseauElectrique : ReseauElectrique;
            part sol : Sol;
            part obstacle : Obstacle[0..*];
            part salete : Salete[0..*];

            /* Utilisateur -> système */
            flow lance from utilisateur to application;
            flow appuieBouton from utilisateur to robot;
            flow remplit from utilisateur to station;

            /* Système -> utilisateur */
            flow notifie from application to utilisateur;
            flow fournitSachet from station to utilisateur;

            /* Échanges internes au système */
            flow controle from application to robot;
            flow informe from robot to application;
            flow recharge from station to robot;
            flow transfereDechets from robot to station;

            /* Wi-Fi */
            flow connecteRobot from robot to wifi;
            flow connecteAppli from application to wifi;

            /* Énergie */
            flow alimente from reseauElectrique to station;

            /* Environnement */
            flow signale from obstacle to robot;
            flow estCollectee from salete to robot;
            flow nettoie from robot to sol;
        }
    }
}