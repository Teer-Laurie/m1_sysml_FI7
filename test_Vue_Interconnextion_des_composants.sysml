
package RobotAspirateur {

    part def RobotAspirateur;
    part def Smartphone;
    part def Sauvegarde;
    part def Fonctions;
    part def Contraintes;

    part def InteractionApplication;
    part def SuiviNettoyage;
    part def MaintenancePreventive;
    part def ControlePieces;
    part def GuideChangementPiecesEntretien;
    part def TableauDeBord;

    part def ConnexionAvecApplication;
    part def AspirerSaletes;
    part def NiveauSalete;
    part def DeplacementAutonome;
    part def DetectionObstacles;
    part def CartographierEnvironnement;

    part def Cout;
    part def Poids;
    part def NiveauSonore;
    part def NiveauDetection;

    part robotAspirateur : RobotAspirateur {

        part smartphone : Smartphone {
            part interactionApplication : InteractionApplication {
                part suiviNettoyage : SuiviNettoyage;
                part maintenancePreventive : MaintenancePreventive {
                    part controlePieces : ControlePieces;
                    part guideChangementPiecesEntretien :
                        GuideChangementPiecesEntretien;
                }
                part tableauDeBord : TableauDeBord;
            }
        }

        part sauvegarde : Sauvegarde;

        part fonctions : Fonctions {
            part interactionApplication : InteractionApplication {
                part connexionAvecApplication :
                    ConnexionAvecApplication;
            }

            part aspirerSaletes : AspirerSaletes {
                part niveauSalete : NiveauSalete;
            }

            part deplacementAutonome : DeplacementAutonome {
                part detectionObstacles : DetectionObstacles;
            }

            part cartographierEnvironnement :
                CartographierEnvironnement;
        }

        part contraintes : Contraintes {
            part cout : Cout;
            part poids : Poids;
            part niveauSonore : NiveauSonore;
            part niveauDetection : NiveauDetection;
        }
    }
}
