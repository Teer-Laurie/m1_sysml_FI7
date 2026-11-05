
package exigencesRobotAspirateur {

    requirement def RobotAspirateur {
        requirement smartphone : Smartphone;
        requirement sauvegarde : Sauvegarde;
        requirement fonctions : Fonctions;
        requirement contraintes : Contraintes;
    }

    /* ===== Smartphone ===== */
    requirement def Smartphone {
        requirement interactionApplication : InteractionApplication;
    }
    requirement def InteractionApplication {
        requirement suiviNettoyage : SuiviNettoyage;
        requirement maintenancePreventive : MaintenancePreventive;
    }
    requirement def SuiviNettoyage {
        requirement tableauDeBord : TableauDeBord;
    }
    requirement def MaintenancePreventive {
        requirement controlePieces : ControlePieces;
        requirement guideChangementPiecesEntretien : GuideChangementPiecesEntretien;
    }
    requirement def ControlePieces {
        requirement tableauDeBord : TableauDeBord;
    }
    requirement def TableauDeBord;
    requirement def GuideChangementPiecesEntretien;

    /* ===== Sauvegarde ===== */
    requirement def Sauvegarde;

    /* ===== Fonctions ===== */
    requirement def Fonctions {
        requirement interactionApplicationRobot : InteractionApplicationRobot;
        requirement aspirerSaletes : AspirerSaletes;
        requirement deplacementAutonome : DeplacementAutonome;
        requirement cartographierEnvironnement : CartographierEnvironnement;
    }
    requirement def InteractionApplicationRobot {
        requirement connexionAvecApplication : ConnexionAvecApplication;
    }
    requirement def ConnexionAvecApplication;
    requirement def AspirerSaletes {
        requirement niveauSalete : NiveauSalete;
    }
    requirement def NiveauSalete;
    requirement def DeplacementAutonome {
        requirement detectionObstacles : DetectionObstacles;
    }
    requirement def DetectionObstacles;
    requirement def CartographierEnvironnement;

    /* ===== Contraintes ===== */
    requirement def Contraintes {
        requirement cout : Cout;
        requirement poids : Poids;
        requirement niveauSonore : NiveauSonore;
        requirement niveauDetection : NiveauDetection;
    }
    requirement def Cout;
    requirement def Poids;
    requirement def NiveauSonore;
    requirement def NiveauDetection;
}
