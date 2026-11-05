
package controle {

    // Vérification des contraintes
    verification contraintesControlees {
        verify contraintes;
    }

    verification coutControle {
        verify cout;
    }

    verification poidsControle {
        verify poids;
    }

    verification niveauSonoreControle {
        verify niveauSonore;
    }

    verification niveauDetectionControle {
        verify niveauDetection;
    }

    // Vérification des fonctions
    verification aspirationVerifiee {
        verify aspirerSaletes;
    }

    verification deplacementVerifie {
        verify deplacementAutonome;
    }

    verification cartographieVerifiee {
        verify cartographierEnvironnement;
    }

    verification detectionVerifiee {
        verify detectionObstacles;
    }

    // Vérification du smartphone
    verification applicationVerifiee {
        verify interactionApplication;
    }

    verification sauvegardeVerifiee {
        verify sauvegarde;
    }
}
