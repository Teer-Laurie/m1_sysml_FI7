package exigencesRobotAspirateur {

    /* définitions des exigences */
    requirement def RobotAspirateur;
    requirement def Smartphone;
    requirement def InteractionApplication;
    requirement def SuiviNettoyage;
    requirement def TableauDeBord;
    requirement def MaintenancePreventive;
    requirement def ControlePieces;
    requirement def GuideChangementPiecesEntretien;
    requirement def Sauvegarde;
    requirement def Fonctions;
    requirement def ConnexionAvecApplication;
    requirement def AspirerSaletes;
    requirement def NiveauSalete;
    requirement def DeplacementAutonome;
    requirement def DetectionObstacles;
    requirement def CartographierEnvironnement;
    requirement def Contraintes;
    requirement def Cout;
    requirement def Poids;
    requirement def NiveauSonore;
    requirement def NiveauDetection;

    /* arborescence des exigences */
    requirement robotAspirateur : RobotAspirateur {
        requirement smartphone : Smartphone {
            requirement interactionApplication : InteractionApplication {
                requirement suiviNettoyage : SuiviNettoyage {
                    requirement tableauDeBord : TableauDeBord;
                }
                requirement maintenancePreventive : MaintenancePreventive {
                    requirement controlePieces : ControlePieces;
                    requirement guideChangementPiecesEntretien : GuideChangementPiecesEntretien;
                }
            }
        }
        requirement sauvegarde : Sauvegarde;
        requirement fonctions : Fonctions {
            requirement interactionApplicationRobot : InteractionApplication {
                requirement connexionAvecApplication : ConnexionAvecApplication;
            }
            requirement aspirerSaletes : AspirerSaletes {
                requirement niveauSalete : NiveauSalete;
            }
            requirement deplacementAutonome : DeplacementAutonome {
                requirement detectionObstacles : DetectionObstacles;
            }
            requirement cartographierEnvironnement : CartographierEnvironnement;
        }
        requirement contraintes : Contraintes {
            requirement cout : Cout;
            requirement poids : Poids;
            requirement niveauSonore : NiveauSonore;
            requirement niveauDetection : NiveauDetection;
        }
    }

    /* lien entre Contrôle des pièces et Tableau de bord */
    dependency
        from robotAspirateur::smartphone::interactionApplication::maintenancePreventive::controlePieces
        to robotAspirateur::smartphone::interactionApplication::suiviNettoyage::tableauDeBord;
}
