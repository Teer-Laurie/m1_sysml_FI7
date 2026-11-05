package robotAspirateur {
    private import ScalarValues::Boolean;
}
part tbi : robotAspirateur {
    part sauvegarde : sauvegarde;
    part smartphone : smartphone {
        part interactionApplication : interactionApplication;
        part suivieDeNettoyage : suivieDeNettoyage;
        part maintenancePreventive : maintenancePreventive;
        part sortieVideo: sortieVideo;
        part controleDesPieces : controleDesPieces;
        part guideDeChangement : guideDeChangement ;
        part tableauDeBord : tableauDeBord;
    }
    part fonctions : fonctions {
        part interactionApplication : interactionApplication;
        part connectionApplication : connectionApplication;
        part aspirerLesSaletes : aspirerLesSaletes;
        part niveauDeSaletes : niveauDeSaletes;
        part deplacementAutonome : deplacementAutonome;
        part detectionObstacles : detectionObstacles;
        part cartographierEnvironnement : cartographierEnvironnement;
    }
    part contraintes : contraintes {
        part cout : cout;
        part poids : poids;
        part niveauSonore : niveauSonore;
        part niveauDeDetection : niveauDeDetection;
    }
}