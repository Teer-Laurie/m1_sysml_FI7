
package controle {

    // Vérification des contraintes
    verification contraintesControlees {
        verifycontraintes;
    }

    verification coutControle {
        verifycout;
    }

    verification poidsControle {
        verifypoids;
    }

    verification niveauSonoreControle {
        verifyniveauSonore;
    }

    verification niveauDetectionControle {
        verifyniveauDetection;
    }

    // Vérification des fonctions
    verification aspirationVerifiee {
        verifyaspirerSaletes;
    }

    verification deplacementVerifie {
        verifydeplacementAutonome;
    }

    verification cartographieVerifiee {
        verifycartographierEnvironnement;
    }

    verification detectionVerifiee {
        verifydetectionObstacles;
    }

    // Vérification du smartphone
    verification applicationVerifiee {
        verifyinteractionApplication;
    }

    verification sauvegardeVerifiee {
        verifysauvegarde;
    }
}
