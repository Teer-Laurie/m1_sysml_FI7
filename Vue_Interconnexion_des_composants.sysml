package exigencesRobotAspirateur {

    requirement 'Robot Aspirateur' {

        requirement 'Smartphone' {
            requirement 'Interaction application' {
                requirement 'Suivie de nettoyage' {
                    requirement 'Tableau de bord';
                }
                requirement 'Maintenance préventive' {
                    requirement 'Contrôle des pièces';
                    requirement "Guide de changement de pièces et d'entretien";
                }
            }
        }

        requirement 'Sauvegarde';

        requirement 'Fonctions' {
            requirement 'Interaction application' {
                requirement 'connection avec application';
            }
            requirement 'Aspirer les saletés' {
                requirement 'Niveau de saleté';
            }
            requirement 'Déplacement autonome' {
                requirement "Détection d'obstacles";
            }
            requirement 'Cartographier Environnement';
        }

        requirement 'Contraintes' {
            requirement 'Coût';
            requirement 'Poids';
            requirement 'Niveau Sonore';
            requirement 'Niveau de détection';
        }
    }

    // Lien entre "Contrôle des pièces" et "Tableau de bord"
    dependency
        from 'Robot Aspirateur'::'Smartphone'::'Interaction application'::'Maintenance préventive'::'Contrôle des pièces'
        to 'Robot Aspirateur'::'Smartphone'::'Interaction application'::'Suivie de nettoyage'::'Tableau de bord';
}
