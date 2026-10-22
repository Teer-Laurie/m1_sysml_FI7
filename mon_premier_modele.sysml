  package robotAspirateur {
    private import ScalarValues::Boolean;

    package parts {
        /* acteurs */
        part def Utilisateur;

        /* contexte */
        part def RobotAspirateur;
        part def StationDeCharge;
        part def SmartPhone;
        part def ReseauWifi;
        part def ReseauElectrique;
        part def Sol;
        part def Obstacle;
        part def Salete;
    }

    private import robotAspirateur::parts::*;

    part def Contexte {
        part utilisateur: Utilisateur;
        part robot: RobotAspirateur;
        part station: StationDeCharge;
        part smartPhone: SmartPhone;
        part wifi: ReseauWifi;
        part reseauElectrique: ReseauElectrique;
        part sol: Sol;
        part obstacle: Obstacle[*];
        part salete: Salete[*];

        /* interactions avec les acteurs */
        flow commande from utilisateur to smartPhone;
        flow vide from utilisateur to robot;          // vidange du bac, entretien
        flow perturbe from animal to robot;

        /* commande et communication */
        flow controle from smartPhone to robot;
        flow informe from robot to smartPhone;        // état, carte, notifications
        connect robot to wifi;
        connect smartPhone to wifi;

        /* énergie */
        flow alimente from reseauElectrique to station;
        flow recharge from station to robot;
        flow retourne from robot to station;          // docking
        connect station to reseauElectrique;

        /* environnement physique */
        flow nettoie from robot to sol;
        flow aspire from salete to robot;
        flow detecte from obstacle to robot;          // perçu par les capteurs
        connect robot to sol;
    }
}