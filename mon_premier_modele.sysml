package robotAspirateur {
    private import ScalarValues::Boolean;

    package parts {
        /* acteurs */
        part def Utilisateur;

        /* contexte */
        part def RobotAspirateur;
        part def StationDeCharge;
        part def AppSmartPhone;
        part def ReseauWifi;
        part def ReseauElectrique;
        part def Sol;
        part def Obstacle;
        part def Salete;
    }

    private import robotAspirateur::parts::*;

    part def Contexte {
        part utilisateur: Utilisateur[*];
        part robot: RobotAspirateur;
        part station: StationDeCharge;
        part appSmartPhone: AppSmartPhone[*];
        part wifi: ReseauWifi;
        part reseauElectrique: ReseauElectrique;
        part sol: Sol;
        part bouton;
        part obstacle: Obstacle[*];
        part salete: Salete[*];

        
        connect robot to wifi;
        connect appSmartPhone to wifi;      
        connect station to reseauElectrique;

        flow lancer from utilisateur to appSmartPhone;
        flow controle from appSmartPhone to robot;
        flow informe from robot to appSmartPhone;     

        flow detecte from robot to obstacle;  
        flow nettoie from robot to sol;
        flow aspire from robot to salete;    
        flow retourne from robot to station;

        flow alimente from reseauElectrique to station;            
        flow alimente from reseauElectrique to station;
        flow recharge from station to robot;    
        flow vide from utilisateur to station;  

        

    
    
    }
}