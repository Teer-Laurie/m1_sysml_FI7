package diagrammeExigences {

    requirement def RobotAspirateur {
        doc /* Le robot aspirateur doit nettoyer l'espace de manière autonome
               et être pilotable depuis un smartphone. */
        requirement smartphone : Smartphone;
        requirement sauvegarde : Sauvegarde;
        requirement fonctions : Fonctions;
        requirement contraintes : Contraintes;
    }

    /* ===== Smartphone ===== */
    requirement def Smartphone {
        doc /* Le système doit être utilisable depuis un smartphone. */
        requirement interactionApplication : InteractionApplication;
    }
    requirement def InteractionApplication {
        doc /* L'utilisateur doit interagir avec le robot via l'application. */
        requirement suiviNettoyage : SuiviNettoyage;
        requirement maintenancePreventive : MaintenancePreventive;
    }
    requirement def SuiviNettoyage {
        doc /* L'application doit permettre de suivre le nettoyage. */
        requirement tableauDeBord : TableauDeBord;
    }
    requirement def MaintenancePreventive {
        doc /* L'application doit proposer une maintenance préventive. */
        requirement controlePieces : ControlePieces;
        requirement guideChangementPiecesEntretien : GuideChangementPiecesEntretien;
    }
    requirement def ControlePieces {
        doc /* L'application doit contrôler l'état des pièces. */
        requirement tableauDeBord : TableauDeBord;
    }
    requirement def TableauDeBord {
        doc /* L'application doit afficher un tableau de bord. */
    }
    requirement def GuideChangementPiecesEntretien {
        doc /* L'application doit fournir un guide de changement
               des pièces et d'entretien. */
    }

    /* ===== Sauvegarde ===== */
    requirement def Sauvegarde {
        doc /* Le système doit sauvegarder les données. */
    }

    /* ===== Fonctions ===== */
    requirement def Fonctions {
        doc /* Le robot doit assurer ses fonctions principales. */
        requirement interactionApplicationRobot : InteractionApplicationRobot;
        requirement aspirerSaletes : AspirerSaletes;
        requirement deplacementAutonome : DeplacementAutonome;
        requirement cartographierEnvironnement : CartographierEnvironnement;
    }
    requirement def InteractionApplicationRobot {
        doc /* Le robot doit interagir avec l'application. */
        requirement connexionAvecApplication : ConnexionAvecApplication;
    }
    requirement def ConnexionAvecApplication {
        doc /* Le robot doit pouvoir se connecter à l'application. */
    }
    requirement def AspirerSaletes {
        doc /* Le robot doit aspirer les saletés. */
        requirement niveauSalete : NiveauSalete;
    }
    requirement def NiveauSalete {
        doc /* Le robot doit évaluer le niveau de saleté. */
    }
    requirement def DeplacementAutonome {
        doc /* Le robot doit se déplacer de manière autonome. */
        requirement detectionObstacles : DetectionObstacles;
    }
    requirement def DetectionObstacles {
        doc /* Le robot doit détecter les obstacles. */
    }
    requirement def CartographierEnvironnement {
        doc /* Le robot doit cartographier son environnement. */
    }

    /* ===== Contraintes ===== */
    requirement def Contraintes {
        doc /* Le robot doit respecter les contraintes de conception. */
        requirement cout : Cout;
        requirement poids : Poids;
        requirement niveauSonore : NiveauSonore;
        requirement niveauDetection : NiveauDetection;
    }
    requirement def Cout {
        doc /* Le coût du robot doit rester limité. */
    }
    requirement def Poids {
        doc /* Le poids du robot doit rester limité. */
    }
    requirement def NiveauSonore {
        doc /* Le niveau sonore du robot doit rester faible. */
    }
    requirement def NiveauDetection {
        doc /* Le robot doit avoir un niveau de détection suffisant. */
    }
}
