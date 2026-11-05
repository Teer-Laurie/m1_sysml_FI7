package systemeRobot {

    package parts {
        /* acteurs */
        part def Utilisateur;

        /* contexte */
        part def Robot;
        part def Smartphone;
        part def ReseauWifi;
        part def Environnement;

        /* composants ajoutés lors de l'exploration des scénarios */
        part def Application;
        part def QRCode;
        part def MenuParametrage;
        part def Message;
        part def Memoire;

        item def Identifiant;
        item def Compte;
        item def Parametres;
        item def Option;
        item def DonneesCarte;

        /* composants ajoutés lors de l'examen des exigences */
        part def CarteMere;
        part def MicroControleur;
        part def ModuleWifi;
        part def MoteurAspiration;
        part def Brosse;
        part def BacPoussiere;
        part def MoteurRoue;
        part def Roue;
        part def CapteurObstacle;
        part def CapteurLidar;
        part def Batterie;
        part def LogicielEmbarque;
        part def TableauDeBord;
        part def ControleurPieces;
        part def GuideEntretien;
    }

    private import parts::*;

    /* ================= ARCHITECTURE PHYSIQUE ================= */
    package architecturePhysique {
        part robot : Robot {
            part carteMere : CarteMere {
                part microControleur : MicroControleur;
                part moduleWifi : ModuleWifi;
                part memoire : Memoire;
            }
            part moteurAspiration : MoteurAspiration;
            part brosses : Brosse[1..*];
            part bacPoussiere : BacPoussiere;
            part moteursRoues : MoteurRoue[2];
            part roues : Roue[2..*];
            part capteursObstacles : CapteurObstacle[1..*];
            part capteurLidar : CapteurLidar;
            part batterie : Batterie;
        }
    }

    /* ================= ARCHITECTURE LOGIQUE ================= */
    package architectureLogique {
        part logicielEmbarque : LogicielEmbarque {
            item donneesCarte : DonneesCarte[0..*];
            item identifiant : Identifiant;
        }

        part application : Application {
            part menuParametrage : MenuParametrage;
            part tableauDeBord : TableauDeBord;
            part controleurPieces : ControleurPieces;
            part guideEntretien : GuideEntretien;
            part messages : Message[0..*];
            item compte : Compte;
            item parametres : Parametres[0..*];
        }
    }
}
