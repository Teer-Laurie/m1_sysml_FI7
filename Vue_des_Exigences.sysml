
package AspiCoo {

    package requirements {

        requirement nettoyageAutonome specializes utilisation {
            doc /* Le robot doit pouvoir effectuer un nettoyage autonome des sols. */
        }

        requirement detectionObstacles specializes utilisation {
            doc /* Le robot doit pouvoir détecter et éviter les obstacles présents sur son trajet. */
        }

        requirement cartographieAutomatique specializes utilisation {
            doc /* Le robot doit pouvoir cartographier automatiquement les espaces à nettoyer. */
        }

        requirement consultationCartographie specializes utilisation {
            doc /* L'utilisateur doit pouvoir consulter la cartographie depuis l'application mobile. */
        }

        requirement selectionZones specializes utilisation {
            doc /* L'utilisateur doit pouvoir sélectionner les pièces ou les zones à nettoyer. */
        }

        requirement programmationNettoyage specializes utilisation {
            doc /* L'utilisateur doit pouvoir programmer des sessions de nettoyage à des jours et heures précis. */
        }

        requirement commandeNettoyage specializes utilisation {
            doc /* L'utilisateur doit pouvoir lancer ou arrêter le nettoyage depuis l'application ou le bouton du robot. */
        }

        requirement detectionSurface specializes utilisation {
            doc /* Le robot doit pouvoir identifier automatiquement le type de surface nettoyée. */
        }

        requirement adaptationNettoyage specializes utilisation {
            doc /* Le robot doit adapter ses paramètres de nettoyage au type de surface détecté. */
        }

        requirement retourStation specializes utilisation {
            doc /* Le robot doit pouvoir retourner automatiquement à sa station lorsque sa batterie est faible. */
        }

        requirement repriseNettoyage specializes utilisation {
            doc /* Le robot doit pouvoir reprendre le nettoyage après une recharge lorsque cela est nécessaire. */
        }

        requirement nettoyageHumide specializes utilisation {
            doc /* Le robot doit pouvoir aspirer et laver les surfaces compatibles avec le nettoyage humide. */
        }

        requirement notificationEntretien specializes utilisation {
            doc /* Le robot doit pouvoir signaler à l'utilisateur lorsqu'un entretien est nécessaire. */
        }

        requirement controleSmartphone specializes utilisation {
            doc /* Le robot doit pouvoir communiquer avec un smartphone via une application mobile. */
        }

        requirement connexionWifi specializes utilisation {
            doc /* Le robot doit pouvoir se connecter à un réseau Wi-Fi. */
        }

        requirement rechargeAutomatique specializes utilisation {
            doc /* La station doit pouvoir recharger automatiquement la batterie du robot. */
        }

        requirement collecteDechets specializes utilisation {
            doc /* La station doit pouvoir récupérer les déchets collectés par le robot. */
        }

        requirement gestionReservoirs specializes utilisation {
            doc /* La station doit pouvoir accueillir un réservoir d'eau et de produits ménagers. */
        }
        

        requirement fonctionnementAutonome specializes performances {
            doc /* Le robot doit pouvoir fonctionner sans intervention permanente de l'utilisateur. */
        }

        requirement autonomieBatterie specializes performances {
            doc /* Le robot doit avoir une autonomie énergétique de 4 heures. */
        }

        requirement compatibiliteSurfaces specializes performances {
            doc /* Le robot doit pouvoir se déplacer sur les différentes surfaces compatibles avec son utilisation. */
        }

        requirement compatibiliteElectrique specializes normes {
            doc /* La station doit être compatible avec la tension du réseau électrique du pays d'utilisation. */
        }

        requirement conformiteNormes specializes normes {
            doc /* Le système doit respecter les normes de sécurité applicables aux appareils électroménagers. */
        }
        

        requirement entretienFacile specializes ergonomie {
            doc /* Le réservoir à déchets doit être facilement accessible, démontable et nettoyable. */
        }
        

        requirement limitationPoussieres specializes environnement {
            doc /* Le système doit limiter la dispersion des poussières lors de la collecte et de l'évacuation des déchets. */
        }
        

        requirement utilisation specializes specificationsAspiCoo {
            doc /* Le système doit répondre aux exigences relatives à son utilisation et à ses fonctionnalités. */
        }

        requirement performances specializes specificationsAspiCoo {
            doc /* Le système doit respecter les performances techniques attendues. */
        }

        requirement normes specializes specificationsAspiCoo {
            doc /* Le système doit respecter les normes et les contraintes électriques applicables. */
        }

        requirement ergonomie specializes specificationsAspiCoo {
            doc /* Le système doit garantir une utilisation et un entretien faciles. */
        }

        requirement environnement specializes specificationsAspiCoo {
            doc /* Le système doit prendre en compte les exigences environnementales. */
        }

        requirement specificationsAspiCoo {
            doc /* Le système AspiCoo doit répondre à l'ensemble des catégories d'exigences définies. */
        }

    }
}
