package exigencesRobotAspirateur {

    requirement robotAspirateur {

        requirement smartphone {
            requirement interactionApplication {
                requirement suiviDeNettoyage {
                    requirement tableauDeBord;
                }
                requirement maintenancePreventive {
                    requirement controleDesPieces;
                    requirement guideChangementPiecesEntretien;
                }
            }
        }

        requirement sauvegarde;

        requirement fonctions {
            requirement interactionApplicationRobot {
                requirement connexionAvecApplication;
            }
            requirement aspirerLesSaletes;
            requirement deplacementAutonome {
                requirement detectionObstacles;
            }
            requirement cartographierEnvironnement;
        }

        requirement contraintes {
            requirement cout;
            requirement poids;
            requirement niveauSonore;
            requirement niveauDeDetection;
        }
    }

    dependency controleVersTableauDeBord
        from robotAspirateur::smartphone::interactionApplication::maintenancePreventive::controleDesPieces
        to robotAspirateur::smartphone::interactionApplication::suiviDeNettoyage::tableauDeBord;
}
