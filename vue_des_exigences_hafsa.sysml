package robotAspirateur {
    package requirements {
        /* tête de la hiérarchie */
        requirement specificationsRobot {
            doc /* le système répond aux catégories d'exigences listées ci-dessous */
        }

        /* groupes */
        requirement interactionsMaterielles specializes specificationsRobot {
            doc /* le système doit disposer des interactions matérielles listées */
        }
        requirement contraintes specializes specificationsRobot {
            doc /* le système doit respecter les contraintes ci-dessous */
        }
        requirement fonctions specializes specificationsRobot {
            doc /* le système doit comprendre les fonctions listées ci-dessous */
        }

        /* interactions matérielles */
        requirement connexionWifi specializes interactionsMaterielles {
            doc /* le système doit communiquer avec l'application via le réseau Wi-Fi domestique */
        }
        requirement compatibiliteElectrique specializes interactionsMaterielles {
            doc /* la station est compatible avec le réseau électrique du pays de l'utilisateur */
        }
        requirement reservoirsEauProduit specializes interactionsMaterielles {
            doc /* la station doit accueillir un réservoir d'eau et un réservoir de produit ménager */
        }
        requirement franchissementObstacles specializes interactionsMaterielles {
            doc /* le robot doit contourner les obstacles imprévus et s'adapter au type de sol */
        }

        /* contraintes (valeurs proposées) */
        requirement autonomieBatterie specializes contraintes {
            doc /* l'autonomie du robot doit être supérieure à 120 min */
        }
        requirement niveauSonore specializes contraintes {
            doc /* le niveau sonore doit être inférieur à 65 dB */
        }
        requirement capaciteReservoir specializes contraintes {
            doc /* le réservoir compacté doit permettre au moins 7 jours entre deux vidanges */
        }
        requirement hauteurRobot specializes contraintes {
            doc /* la hauteur du robot doit être inférieure à 10 cm */
        }
        requirement coutRevient specializes contraintes {
            doc /* le prix de revient doit être inférieur à 400 € */
        }

        /* fonctions */
        requirement lancementNettoyage specializes fonctions {
            doc /* l'utilisateur doit pouvoir lancer un nettoyage depuis l'application ou le bouton du robot */
        }
        requirement programmationNettoyage specializes fonctions {
            doc /* l'utilisateur doit pouvoir programmer un nettoyage */
        }
        requirement cartographieLogement specializes fonctions {
            doc /* le robot doit cartographier le logement et actualiser la carte en temps réel */
        }
        requirement selectionZones specializes fonctions {
            doc /* l'utilisateur doit pouvoir choisir les zones à nettoyer */
        }
        requirement notificationUtilisateur specializes fonctions {
            doc /* l'application doit notifier l'utilisateur de l'état du système */
        }
        requirement nettoyageAdaptatif specializes fonctions {
            doc /* le robot doit détecter les zones sales et ajuster sa puissance d'aspiration */
        }
        requirement maintenancePreventive specializes fonctions {
            doc /* le robot doit détecter l'encrassement ou l'usure et prévenir l'utilisateur avant la panne */
        }
        requirement compactageDechets specializes fonctions {
            doc /* le réservoir doit comprimer mécaniquement les déchets collectés */
        }
        requirement evacuationDechets specializes fonctions {
            doc /* la station doit transférer les déchets dans des sachets biodégradables sans contact pour l'utilisateur */
        }
        requirement retourAutomatique specializes fonctions {
            doc /* le robot doit retourner à sa station lorsque la batterie est faible ou la session terminée, puis reprendre son travail */
        }
    }
}
