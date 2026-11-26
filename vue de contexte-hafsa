package robotAspirateur {
    private import ScalarValues::Boolean;

    package parts {
        /* acteurs */
        part def Utilisateur;

        /* système d'intérêt */
        part def RobotNettoyeur;
        part def StationRechargeEvacuation;
        part def ApplicationMobile;
        part def SystemeRobotAspirateurLaveur {
            part robot : RobotNettoyeur;
            part station : StationRechargeEvacuation;
            part application : ApplicationMobile;
        }

        /* éléments externes */
        part def ReseauWifi;
        part def ReseauElectrique;
        part def Sol;
        part def Obstacle;
        part def Salete;
        part def SachetBiodegradable;
    }

    private import robotAspirateur::parts::*;

    part def Contexte {
        part utilisateur : Utilisateur[1..*];
        part systeme : SystemeRobotAspirateurLaveur;
        part reseauWifi : ReseauWifi;
        part reseauElectrique : ReseauElectrique;
        part sol : Sol;
        part obstacle : Obstacle[*];
        part salete : Salete[*];
        part sachet : SachetBiodegradable[*];

        /* interactions utilisateur */
        flow commande from utilisateur to systeme.application;
        flow appuieBouton from utilisateur to systeme.robot;
        flow notifie from systeme.application to utilisateur;
        flow remplitReservoirs from utilisateur to systeme.station;
        flow retireSachet from systeme.station to utilisateur;

        /* communication */
        flow communique from systeme.application to reseauWifi;
        flow communique from reseauWifi to systeme.robot;

        /* énergie */
        flow alimente from reseauElectrique to systeme.station;
        flow recharge from systeme.station to systeme.robot;
        connect systeme.station to reseauElectrique;

        /* environnement de travail */
        flow nettoie from systeme.robot to sol;
        flow detecte from obstacle to systeme.robot;
        flow aspire from salete to systeme.robot;
        flow evacueDechets from systeme.robot to systeme.station;
        flow conditionne from systeme.station to sachet;
    }
}
