package diagrammeExigences {

    /* ===== exigences ===== */
    requirement robotAspirateur;

    requirement smartphone;
    requirement interactionApplication;
    requirement suiviNettoyage;
    requirement maintenancePreventive;
    requirement controlePieces;
    requirement guideChangementPiecesEntretien;
    requirement tableauDeBord;

    requirement sauvegarde;

    requirement fonctions;
    requirement interactionApplicationRobot;
    requirement connexionAvecApplication;
    requirement aspirerSaletes;
    requirement niveauSalete;
    requirement deplacementAutonome;
    requirement detectionObstacles;
    requirement cartographierEnvironnement;

    requirement contraintes;
    requirement cout;
    requirement poids;
    requirement niveauSonore;
    requirement niveauDetection;

    /* ===== liens de l'arborescence (enfant -> parent) ===== */
    dependency from smartphone to robotAspirateur;
    dependency from sauvegarde to robotAspirateur;
    dependency from fonctions to robotAspirateur;
    dependency from contraintes to robotAspirateur;

    dependency from interactionApplication to smartphone;
    dependency from suiviNettoyage to interactionApplication;
    dependency from maintenancePreventive to interactionApplication;
    dependency from tableauDeBord to suiviNettoyage;
    dependency from controlePieces to maintenancePreventive;
    dependency from guideChangementPiecesEntretien to maintenancePreventive;
    dependency from tableauDeBord to controlePieces;

    dependency from interactionApplicationRobot to fonctions;
    dependency from aspirerSaletes to fonctions;
    dependency from deplacementAutonome to fonctions;
    dependency from cartographierEnvironnement to fonctions;
    dependency from connexionAvecApplication to interactionApplicationRobot;
    dependency from niveauSalete to aspirerSaletes;
    dependency from detectionObstacles to deplacementAutonome;

    dependency from cout to contraintes;
    dependency from poids to contraintes;
    dependency from niveauSonore to contraintes;
    dependency from niveauDetection to contraintes;
}
