package exigencesRobotAspirateur {

    requirement <'R1'> robotAspirateur {
        doc /* Le robot aspirateur doit nettoyer l'espace de manière autonome
               et être contrôlable depuis un smartphone. */

        requirement <'R1.1'> smartphone {
            doc /* Le système doit pouvoir être utilisé depuis un smartphone. */

            requirement <'R1.1.1'> interactionApplication {
                doc /* L'utilisateur doit interagir avec le robot via l'application. */

                requirement <'R1.1.1.1'> suiviDeNettoyage {
                    doc /* L'application doit permettre de suivre le nettoyage. */

                    requirement <'R1.1.1.1.1'> tableauDeBord {
                        doc /* L'application doit afficher un tableau de bord. */
                    }
                }

                requirement <'R1.1.1.2'> maintenancePreventive {
                    doc /* L'application doit proposer une maintenance préventive. */

                    requirement <'R1.1.1.2.1'> controleDesPieces {
                        doc /* L'application doit contrôler l'état des pièces. */
                    }

                    requirement <'R1.1.1.2.2'> guideChangementPiecesEntretien {
                        doc /* L'application doit fournir un guide de changement
                               des pièces et d'entretien. */
                    }
                }
            }
        }

        requirement <'R1.2'> sauvegarde {
            doc /* Le système doit sauvegarder les données. */
        }

        requirement <'R1.3'> fonctions {
            doc /* Le robot doit assurer ses fonctions principales. */

            requirement <'R1.3.1'> interactionApplicationRobot {
                doc /* Le robot doit interagir avec l'application. */

                requirement <'R1.3.1.1'> connexionAvecApplication {
                    doc /* Le robot doit pouvoir se connecter à l'application. */
                }
            }

            requirement <'R1.3.2'> aspirerLesSaletes {
                doc /* Le robot doit aspirer les saletés. */
            }

            requirement <'R1.3.3'> deplacementAutonome {
                doc /* Le robot doit se déplacer de manière autonome. */

                requirement <'R1.3.3.1'> detectionObstacles {
                    doc /* Le robot doit détecter les obstacles. */
                }
            }

            requirement <'R1.3.4'> cartographierEnvironnement {
                doc /* Le robot doit cartographier son environnement. */
            }
        }

        requirement <'R1.4'> contraintes {
            doc /* Le robot doit respecter les contraintes de conception. */

            requirement <'R1.4.1'> cout {
                doc /* Le coût du robot doit rester limité. */
            }

            requirement <'R1.4.2'> poids {
                doc /* Le poids du robot doit rester limité. */
            }

            requirement <'R1.4.3'> niveauSonore {
                doc /* Le niveau sonore du robot doit rester faible. */
            }

            requirement <'R1.4.4'> niveauDeDetection {
                doc /* Le robot doit avoir un niveau de détection suffisant. */
            }
        }
    }

    // Le tableau de bord est aussi relié au contrôle des pièces
    dependency controleVersTableauDeBord
        from robotAspirateur::smartphone::interactionApplication::maintenancePreventive::controleDesPieces
        to robotAspirateur::smartphone::interactionApplication::suiviDeNettoyage::tableauDeBord;
}
