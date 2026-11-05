package RobotAspirateur {

    part def RobotAspirateur {

        part smartphone : Smartphone;
        part sauvegarde : Sauvegarde;

        part fonctions : Fonctions {
            part interactionApplication : InteractionApplication {
                part connexionAvecApplication : ConnexionAvecApplication;
            }

            part aspirerSaletes : AspirerSaletes {
                part niveauSalete : NiveauSalete;
            }

            part deplacementAutonome : DeplacementAutonome {
                part detectionObstacles : DetectionObstacles;
            }

            part cartographierEnvironnement : CartographierEnvironnement;
        }

        part contraintes : Contraintes {
            part cout : Cout;
            part poids : Poids;
            part niveauSonore : NiveauSonore;
            part niveauDetection : NiveauDetection;
        }
    }

    // Exigences liées au smartphone

    part def Smartphone {
        part interactionApplication : InteractionApplication {
            part suiviNettoyage : SuiviNettoyage;
            part maintenancePreventive : MaintenancePreventive {
                part controlePieces : ControlePieces;
                part guideChangementPiecesEtEntretien :
                    GuideChangementPiecesEtEntretien;
            }
            part tableauDeBord : TableauDeBord;
        }
    }

    // Définitions des exigences

    part def Sauvegarde;
    part def Fonctions;

    part def InteractionApplication;
    part def ConnexionAvecApplication;

    part def AspirerSaletes;
    part def NiveauSalete;

    part def DeplacementAutonome;
    part def DetectionObstacles;

    part def CartographierEnvironnement;

    part def Contraintes;
    part def Cout;
    part def Poids;
    part def NiveauSonore;
    part def NiveauDetection;

    part def SuiviNettoyage;
    part def MaintenancePreventive;
    part def ControlePieces;
    part def GuideChangementPiecesEtEntretien;
    part def TableauDeBord;
}