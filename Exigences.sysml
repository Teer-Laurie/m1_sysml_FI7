
package AspiCoo {

    package requirements {

        // ==========================================
        // 1. EXIGENCES GENERALES
        // ==========================================




        requirement normes specializes specificationsAspiCoo {
            doc /* Le système doit respecter les normes de sécurité et les contraintes réglementaires applicables. */
        }

        requirement ergonomie specializes specificationsAspiCoo {
            doc /* Le système doit garantir une utilisation et un entretien faciles. */
        }

        requirement environnement specializes specificationsAspiCoo {
            doc /* Le système doit prendre en compte les exigences environnementales. */
        }


        // ==========================================
        // 2. EXIGENCES D'UTILISATION
        // ==========================================

        requirement nettoyageAutonome specializes utilisation {
            doc /* Le robot doit pouvoir effectuer automatiquement le nettoyage des sols sans intervention permanente de l'utilisateur. */
        }

        requirement commandeNettoyage specializes utilisation {
            doc /* L'utilisateur doit pouvoir lancer ou arrêter une session de nettoyage depuis l'application mobile ou le bouton du robot. */
        }

        requirement programmationNettoyage specializes utilisation {
            doc /* L'utilisateur doit pouvoir programmer des sessions de nettoyage à des jours et heures précis. */
        }

        requirement selectionZones specializes utilisation {
            doc /* L'utilisateur doit pouvoir sélectionner les pièces ou les zones à nettoyer depuis l'application mobile. */
        }

        requirement cartographieAutomatique specializes utilisation {
            doc /* Le robot doit pouvoir cartographier automatiquement les espaces à nettoyer. */
        }

        requirement miseAJourCartographie specializes utilisation {
            doc /* Le robot doit pouvoir actualiser les informations de sa cartographie pendant ses déplacements. */
        }

        requirement consultationCartographie specializes utilisation {
            doc /* L'utilisateur doit pouvoir consulter la cartographie de son environnement depuis l'application mobile. */
        }

        requirement detectionObstacles specializes utilisation {
            doc /* Le robot doit pouvoir détecter les obstacles présents sur son trajet afin d'éviter les collisions. */
        }

        requirement adaptationParcours specializes utilisation {
            doc /* Le robot doit pouvoir réorganiser localement son parcours lorsqu'un obstacle ou une situation imprévue est détecté. */
        }

        requirement detectionSurface specializes utilisation {
            doc /* Le robot doit pouvoir identifier automatiquement le type de surface rencontré pendant son déplacement. */
        }

        requirement adaptationNettoyage specializes utilisation {
            doc /* Le robot doit adapter son mode et ses paramètres de nettoyage en fonction du type de surface détecté. */
        }

        requirement nettoyageHumide specializes utilisation {
            doc /* Le robot doit pouvoir effectuer l'aspiration et le lavage humide des surfaces compatibles avec ces modes de nettoyage. */
        }

        requirement detectionSalete specializes utilisation {
            doc /* Le robot doit pouvoir détecter le niveau de saleté des zones à nettoyer. */
        }

        requirement ajustementAspiration specializes utilisation {
            doc /* Le robot doit pouvoir ajuster automatiquement sa puissance d'aspiration en fonction du niveau de saleté détecté. */
        }

        requirement connexionWifi specializes utilisation {
            doc /* Le robot doit pouvoir se connecter à un réseau Wi-Fi pour communiquer avec l'application mobile. */
        }

        requirement controleSmartphone specializes utilisation {
            doc /* L'utilisateur doit pouvoir communiquer avec le robot et accéder à ses principales fonctionnalités depuis une application mobile. */
        }

        requirement retourStation specializes utilisation {
            doc /* Le robot doit pouvoir retourner automatiquement à sa station lorsque sa batterie est faible ou lorsqu'une session est terminée. */
        }

        requirement repriseNettoyage specializes utilisation {
            doc /* Le robot doit pouvoir reprendre une session de nettoyage interrompue après une recharge lorsque cela est nécessaire. */
        }

        requirement rechargeAutomatique specializes utilisation {
            doc /* La station doit pouvoir recharger automatiquement la batterie du robot lorsqu'il est connecté à celle-ci. */
        }

        requirement collecteDechets specializes utilisation {
            doc /* La station doit pouvoir récupérer les déchets présents dans le réservoir du robot et les transférer vers son réservoir principal. */
        }

        requirement gestionReservoirs specializes utilisation {
            doc /* La station doit pouvoir accueillir et maintenir les réservoirs d'eau et de produit ménager nécessaires au lavage. */
        }

        requirement compactageDechets specializes utilisation {
            doc /* Le robot doit intégrer un mécanisme permettant de compacter mécaniquement les déchets collectés dans son réservoir afin de réduire leur volume. */
        }

        requirement transfertDechets specializes utilisation {
            doc /* La station doit permettre le transfert automatique des déchets compactés du réservoir du robot vers le réservoir principal de la station. */
        }

        requirement stockageSachets specializes utilisation {
            doc /* La station doit permettre le stockage des déchets dans des sachets biodégradables superposés. */
        }

        requirement remplacementSachet specializes utilisation {
            doc /* L'utilisateur doit pouvoir retirer manuellement un sachet plein afin d'accéder au sachet suivant. */
        }

        requirement detectionEncrassement specializes utilisation {
            doc /* Le robot doit pouvoir détecter les signes d'encrassement ou de blocage de certains composants, notamment les brosses et les filtres. */
        }

        requirement notificationEntretien specializes utilisation {
            doc /* Le robot doit pouvoir avertir l'utilisateur lorsqu'une opération d'entretien ou de maintenance préventive est nécessaire. */
        }


        // ==========================================
        // 3. EXIGENCES DE PERFORMANCE
        // ==========================================

        requirement fonctionnementAutonome specializes performances {
            doc /* Le robot doit pouvoir réaliser ses opérations de nettoyage et gérer ses déplacements sans intervention permanente de l'utilisateur. */
        }

        requirement autonomieBatterie specializes performances {
            doc /* Le robot doit disposer d'une autonomie énergétique cible de quatre heures dans des conditions normales d'utilisation. */
        }

        requirement compatibiliteSurfaces specializes performances {
            doc /* Le robot doit pouvoir se déplacer et fonctionner sur les différentes surfaces compatibles avec son utilisation. */
        }

        requirement capaciteReservoir specializes performances {
            doc /* Le réservoir à déchets du robot doit disposer d'une capacité adaptée à la collecte des déchets pendant une session de nettoyage. */
        }

        requirement efficaciteCompactage specializes performances {
            doc /* Le mécanisme de compactage doit réduire le volume occupé par les déchets collectés dans le réservoir du robot. */
        }

        requirement efficaciteNettoyage specializes performances {
            doc /* Le robot doit assurer un nettoyage efficace des surfaces compatibles avec les modes d'aspiration et de lavage. */
        }


        // ==========================================
        // 4. EXIGENCES REGLEMENTAIRES
        // ==========================================

        requirement compatibiliteElectrique specializes normes {
            doc /* La station doit être compatible avec la tension et les caractéristiques du réseau électrique du pays d'utilisation. */
        }

        requirement conformiteNormes specializes normes {
            doc /* Le système doit respecter les normes de sécurité applicables aux appareils électroménagers et aux équipements électriques. */
        }


        // ==========================================
        // 5. EXIGENCES ERGONOMIQUES
        // ==========================================

        requirement entretienFacile specializes ergonomie {
            doc /* Le réservoir à déchets du robot doit être facilement accessible, démontable et nettoyable. */
        }

        requirement remplacementFacile specializes ergonomie {
            doc /* Le remplacement manuel des sachets biodégradables doit être simple et accessible à l'utilisateur. */
        }

        requirement faciliteUtilisation specializes ergonomie {
            doc /* L'application mobile et les commandes du robot doivent permettre une utilisation simple et compréhensible. */
        }


        // ==========================================
        // 6. EXIGENCES ENVIRONNEMENTALES
        // ==========================================

        requirement limitationPoussieres specializes environnement {
            doc /* Le système doit limiter la dispersion des poussières lors du compactage, de la collecte et du transfert des déchets. */
        }


        requirement consommationRaisonnee specializes environnement {
            doc /* Le robot doit adapter l'utilisation de l'eau, du produit ménager et de l'énergie aux besoins réels du nettoyage. */
        }

    }
}
