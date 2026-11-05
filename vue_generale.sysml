package vueGenerale {

    /* système global */
    part def SystemeRobotAspirateur {
        part robot : Robot;
        part smartphone : Smartphone;
        part reseauWifi : ReseauWifi;
    }

    /* architecture physique du robot */
    part def Robot {
        part carteMere : CarteMere;
        part batterie : Batterie;
        part moteurAspiration : MoteurAspiration;
        part brosses : Brosse[1..*];
        part bacPoussiere : BacPoussiere;
        part moteursRoues : MoteurRoue[2];
        part roues : Roue[2..*];
        part capteursObstacles : CapteurObstacle[1..*];
        part capteurLidar : CapteurLidar;
        part logicielEmbarque : LogicielEmbarque;
    }

    part def CarteMere {
        part microControleur : MicroControleur;
        part moduleWifi : ModuleWifi;
        part memoire : Memoire;
    }

    /* architecture logique côté smartphone */
    part def Smartphone {
        part application : Application;
    }

    part def Application {
        part menuParametrage : MenuParametrage;
        part tableauDeBord : TableauDeBord;
        part controleurPieces : ControleurPieces;
        part guideEntretien : GuideEntretien;
        part messages : Message[0..*];
    }

    /* composants élémentaires */
    part def ReseauWifi;
    part def Batterie;
    part def MoteurAspiration;
    part def Brosse;
    part def BacPoussiere;
    part def MoteurRoue;
    part def Roue;
    part def CapteurObstacle;
    part def CapteurLidar;
    part def LogicielEmbarque;
    part def MicroControleur;
    part def ModuleWifi;
    part def Memoire;
    part def MenuParametrage;
    part def TableauDeBord;
    part def ControleurPieces;
    part def GuideEntretien;
    part def Message;
}
