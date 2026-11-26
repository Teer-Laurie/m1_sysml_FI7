package ExigencesRAL {

    requirement specificationsRAL {
        doc /* Le système robot aspirateur laveur (robot, station, application) doit satisfaire l'ensemble des exigences ci-dessous. */

        /* ===== EXIGENCES FONCTIONNELLES ===== */
        requirement fonctionnel {
            doc /* Exigences relatives aux fonctionnalités du système. */

            requirement commande {
                doc /* Commande, connectivité et mise en service */
                requirement <'EF-01'> lancerArreter {
                    doc /* L'utilisateur doit pouvoir lancer ou arrêter un nettoyage depuis l'application ou le bouton du robot. */
                }
                requirement <'EF-02'> programmation {
                    doc /* L'utilisateur doit pouvoir programmer des sessions à des jours et heures précis. */
                }
                requirement <'EF-03'> selectionZones {
                    doc /* L'utilisateur doit pouvoir sélectionner les pièces ou zones à nettoyer depuis l'application. */
                }
                requirement <'EF-04'> connexionWifi {
                    doc /* Le robot doit se connecter à un réseau Wi-Fi pour communiquer avec l'application. */
                }
                requirement <'EF-26'> appairage {
                    doc /* L'utilisateur doit pouvoir appairer le robot avec l'application lors de la mise en service. */
                }
                requirement <'EF-30'> signalementRobotInjoignable {
                    doc /* L'application doit informer l'utilisateur lorsque le robot est injoignable. */
                }
            }

            requirement navigation {
                doc /* Navigation et cartographie (innovation 1) */
                requirement <'EF-05'> cartographieAutomatique {
                    doc /* Le robot doit cartographier automatiquement les espaces à nettoyer. */
                }
                requirement <'EF-06'> miseAJourCarte {
                    doc /* Le robot doit actualiser sa carte pendant ses déplacements. */
                }
                requirement <'EF-07'> consultationCarte {
                    doc /* L'utilisateur doit pouvoir consulter la carte depuis l'application. */
                }
                requirement <'EF-08'> detectionObstacles {
                    doc /* Le robot doit détecter les obstacles sur son trajet pour éviter les collisions. */
                }
                requirement <'EF-09'> adaptationParcours {
                    doc /* Le robot doit réorganiser localement son parcours face à un obstacle ou une situation imprévue. */
                }
            }

            requirement nettoyage {
                doc /* Nettoyage (innovation 3) */
                requirement <'EF-10'> nettoyageAutonome {
                    doc /* Le robot doit nettoyer les sols sans intervention de l'utilisateur pendant une session. */
                }
                requirement <'EF-11'> nettoyageHumide {
                    doc /* Le robot doit aspirer et laver les surfaces compatibles. */
                }
                requirement <'EF-12'> detectionSurface {
                    doc /* Le robot doit identifier le type de surface rencontré. */
                }
                requirement <'EF-13'> adaptationSurface {
                    doc /* Le robot doit adapter son mode et ses paramètres de nettoyage à la surface détectée. */
                }
                requirement <'EF-14'> detectionSalete {
                    doc /* Le robot doit détecter le niveau de saleté des zones. */
                }
                requirement <'EF-15'> ajustementAspiration {
                    doc /* Le robot doit ajuster sa puissance d'aspiration selon le niveau de saleté. */
                }
                requirement <'EF-33'> compatibiliteSurfaces {
                    doc /* Le robot doit se déplacer sur les surfaces compatibles (carrelage, parquet, moquette rase). */
                }
            }

            requirement energie {
                doc /* Énergie */
                requirement <'EF-16'> retourStation {
                    doc /* Le robot doit retourner à sa station lorsque la batterie est faible ou la session terminée. */
                }
                requirement <'EF-17'> repriseNettoyage {
                    doc /* Le robot doit reprendre une session interrompue après recharge. */
                }
                requirement <'EF-18'> rechargeAutomatique {
                    doc /* La station doit recharger automatiquement la batterie du robot. */
                }
            }

            requirement dechets {
                doc /* Déchets et consommables (innovation 2) */
                requirement <'EF-19'> compactage {
                    doc /* Le robot doit compacter mécaniquement les déchets collectés dans son réservoir. */
                }
                requirement <'EF-20'> transfertDechets {
                    doc /* La station doit récupérer automatiquement les déchets compactés du robot. */
                }
                requirement <'EF-21'> stockageSachets {
                    doc /* La station doit stocker les déchets dans des sachets biodégradables, sans contact direct de l'utilisateur avec les déchets. */
                }
                requirement <'EF-22'> remplacementSachet {
                    doc /* L'utilisateur doit pouvoir retirer un sachet plein pour accéder au suivant. */
                }
                requirement <'EF-23'> gestionReservoirsLiquides {
                    doc /* La station doit accueillir les réservoirs d'eau et de produit ménager. */
                }
                requirement <'EF-27'> detectionPresenceSachet {
                    doc /* La station doit détecter la présence d'un sachet avant tout transfert de déchets et prévenir l'utilisateur en son absence. */
                }
                requirement <'EF-31'> notificationSachetPlein {
                    doc /* Le système doit mesurer le niveau de remplissage du sachet et notifier l'utilisateur lorsque le sachet est plein. */
                }
                requirement <'EF-32'> surveillanceNiveauxLiquides {
                    doc /* Le système doit mesurer les niveaux d'eau et de produit ménager et notifier l'utilisateur lorsqu'un niveau est bas. */
                }
            }

            requirement maintenance {
                doc /* Maintenance préventive (innovation 4) */
                requirement <'EF-24'> detectionEncrassement {
                    doc /* Le robot doit détecter l'encrassement ou le blocage de composants (brosses, filtre) à la fin de chaque session de nettoyage. */
                }
                requirement <'EF-25'> notificationEntretien {
                    doc /* Le système doit avertir l'utilisateur, via l'application, avant une panne probable, en identifiant le composant concerné. */
                }
                requirement <'EF-28'> guideEntretien {
                    doc /* L'application doit permettre de consulter un guide d'entretien et de remplacement du composant concerné par l'alerte. */
                }
                requirement <'EF-29'> verificationApresIntervention {
                    doc /* Le système doit vérifier l'état des composants après une intervention de l'utilisateur, réinitialiser le suivi d'usure si l'état est rétabli et signaler si l'anomalie persiste. */
                }
            }
        }

        /* ===== EXIGENCES DE PERFORMANCE ===== */
        requirement performances {
            doc /* Exigences quantifiées (valeurs cibles à valider). */
            requirement <'PE-01'> autonomie {
                doc /* Autonomie énergétique supérieure ou égale à 4 h en conditions normales d'utilisation. */
            }
            requirement <'PE-02'> seuilRetour {
                doc /* Le retour à la station doit être déclenché quand la batterie atteint 15 % de charge. */
            }
            requirement <'PE-03'> efficaciteCompactage {
                doc /* Le compactage doit réduire d'au moins 30 % le volume des déchets collectés. */
            }
            requirement <'PE-04'> capaciteReservoir {
                doc /* Le réservoir du robot doit contenir au moins 0,5 L de déchets compactés sans dépasser le gabarit extérieur du robot. */
            }
            requirement <'PE-05'> fiabiliteSurface {
                doc /* Le type de surface doit être correctement identifié dans au moins 90 % des cas. */
            }
            requirement <'PE-06'> delaiAlerte {
                doc /* Toute alerte (entretien, sachet, niveau de liquide) doit parvenir à l'application dans les 5 minutes suivant sa détection. */
            }
            requirement <'PE-07'> niveauSonore {
                doc /* Le niveau sonore du robot en fonctionnement normal doit être inférieur à 65 dB(A). */
            }
        }

        /* ===== CONTRAINTES PHYSIQUES ET ÉCONOMIQUES ===== */
        requirement contraintes {
            doc /* Le système doit respecter les contraintes ci-dessous (valeurs cibles à valider). */
            requirement <'CO-01'> hauteurRobot {
                doc /* La hauteur du robot doit être inférieure ou égale à 10 cm pour passer sous les meubles. */
            }
            requirement <'CO-02'> poidsRobot {
                doc /* Le poids du robot doit être inférieur à 4 kg. */
            }
            requirement <'CO-03'> coutRevient {
                doc /* Le prix de revient du système complet doit être inférieur à 400 €. */
            }
        }

        /* ===== NORMES ET RÉGLEMENTATION ===== */
        requirement normes {
            doc /* Normes et réglementation applicables. */
            requirement <'NO-01'> securiteElectrique {
                doc /* Le système doit respecter les normes de sécurité des appareils électrodomestiques (série IEC 60335). */
            }
            requirement <'NO-02'> compatibiliteReseau {
                doc /* La station doit être compatible avec la tension et la fréquence du réseau du pays d'utilisation (230 V / 50 Hz en France). */
            }
        }

        /* ===== ERGONOMIE ===== */
        requirement ergonomie {
            doc /* Facilité d'utilisation et d'entretien. */
            requirement <'ER-01'> accesReservoir {
                doc /* Le réservoir du robot doit être démontable sans outil et nettoyable. */
            }
            requirement <'ER-02'> faciliteApplication {
                doc /* Le lancement d'un nettoyage depuis l'application doit nécessiter au plus 3 interactions. */
            }
        }

        /* ===== ENVIRONNEMENT ===== */
        requirement environnement {
            doc /* Exigences environnementales. */
            requirement <'EN-01'> poussieres {
                doc /* Le compactage et le transfert doivent retenir au moins 99 % des poussières (filtration de classe HEPA). */
            }
            requirement <'EN-02'> consommationRaisonnee {
                doc /* Le nettoyage adaptatif doit réduire d'au moins 20 % la consommation d'énergie et d'eau par rapport à un nettoyage à puissance constante. */
            }
        }
    }
}
