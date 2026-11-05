package systemeRobot {

    /* ================= COMPOSANTS ================= */
    package parts {
        /* acteurs */
        part def Utilisateur;

        /* contexte */
        part def Robot;
        part def Smartphone;
        part def ReseauWifi;
        part def Environnement;

        /* composants ajoutés lors de l'exploration des scénarios */
        part def Application;
        part def QRCode;
        part def MenuParametrage;
        part def Message;
        part def Memoire;

        item def Identifiant;
        item def Compte;
        item def Parametres;
        item def Option;
        item def DonneesCarte;

        /* composants ajoutés lors de l'examen des exigences */
        part def CarteMere;
        part def MicroControleur;
        part def ModuleWifi;
        part def MoteurAspiration;
        part def Brosse;
        part def BacPoussiere;
        part def MoteurRoue;
        part def Roue;
        part def CapteurObstacle;
        part def CapteurLidar;
        part def Batterie;
        part def LogicielEmbarque;
        part def TableauDeBord;
        part def ControleurPieces;
        part def GuideEntretien;
    }

    /* ================= EXIGENCES ================= */
    package exigences {
        requirement robotAspirateur {
            requirement pilotageSmartphone {
                requirement interactionApplicationSmartphone {
                    requirement suiviNettoyage {
                        requirement affichageTableauDeBord;
                    }
                    requirement maintenancePreventive {
                        requirement controlePieces;
                        requirement guideChangementPieces;
                    }
                }
            }
            requirement sauvegardeDonnees;
            requirement fonctions {
                requirement interactionRobotApplication {
                    requirement connexionApplication;
                }
                requirement aspirationSaletes;
                requirement deplacementAutonome {
                    requirement detectionObstacles;
                }
                requirement cartographieEnvironnement;
            }
            requirement contraintes {
                requirement coutRevient;
                requirement poidsTotal;
                requirement niveauSonore;
                requirement niveauDetection;
            }
        }
    }

    private import parts::*;
    private import exigences::**;

    /* ================= CAS D'UTILISATION ================= */
    package casUtilisation {
        use case configurerSysteme {
            actor utilisateur : Utilisateur;
            require interactionRobotApplication;
            require connexionApplication;
        }
        use case cartographierEnvironnement {
            actor utilisateur : Utilisateur;
            require cartographieEnvironnement;
            require sauvegardeDonnees;
        }
        use case lancerNettoyage {
            actor utilisateur : Utilisateur;
            require aspirationSaletes;
            require deplacementAutonome;
        }
        use case suivreNettoyage {
            actor utilisateur : Utilisateur;
            require suiviNettoyage;
        }
        use case effectuerMaintenance {
            actor utilisateur : Utilisateur;
            require maintenancePreventive;
        }
    }

    /* ================= RECETTE ================= */
    package recette {
        verification systemeConfigure {
            verify interactionRobotApplication;
        }
        verification environnementCartographie {
            verify cartographieEnvironnement;
        }
        verification donneesSauvegardees {
            verify sauvegardeDonnees;
        }
        verification nettoyageSuivi {
            verify suiviNettoyage;
        }
        verification maintenanceEffectuee {
            verify maintenancePreventive;
        }
        verification fonctionsVerifiees {
            verify fonctions;
        }
    }

    /* ================= CONTRÔLE ================= */
    package controle {
        verification contraintesControlees {
            verify contraintes;
        }
        verification controleCoutRevient {
            verify coutRevient;
        }
        verification controlePoidsTotal {
            verify poidsTotal;
        }
        verification controleNiveauSonore {
            verify niveauSonore;
        }
        verification controleNiveauDetection {
            verify niveauDetection;
        }
    }

    /* ================= ARCHITECTURE PHYSIQUE ================= */
    package architecturePhysique {
        part robot : Robot {
            satisfy robotAspirateur;

            part carteMere : CarteMere {
                part microControleur : MicroControleur;
                part moduleWifi : ModuleWifi {
                    satisfy connexionApplication;
                }
                part memoire : Memoire {
                    satisfy sauvegardeDonnees;
                }
            }
            part moteurAspiration : MoteurAspiration {
                satisfy aspirationSaletes;
            }
            part brosses : Brosse[1..*] {
                satisfy aspirationSaletes;
            }
            part bacPoussiere : BacPoussiere {
                satisfy aspirationSaletes;
            }
            part moteursRoues : MoteurRoue[2] {
                satisfy deplacementAutonome;
            }
            part roues : Roue[2..*] {
                satisfy deplacementAutonome;
            }
            part capteursObstacles : CapteurObstacle[1..*] {
                satisfy detectionObstacles;
            }
            part capteurLidar : CapteurLidar {
                satisfy cartographieEnvironnement;
            }
            part batterie : Batterie;
        }
    }

    /* ================= ARCHITECTURE LOGIQUE ================= */
    package architectureLogique {
        part logicielEmbarque : LogicielEmbarque {
            satisfy interactionRobotApplication;
        }

        part application : Application {
            satisfy pilotageSmartphone;
            satisfy interactionApplicationSmartphone;

            part tableauDeBord : TableauDeBord {
                satisfy affichageTableauDeBord;
            }
            part controleurPieces : ControleurPieces {
                satisfy controlePieces;
            }
            part guideEntretien : GuideEntretien {
                satisfy guideChangementPieces;
            }
            part menuParametrage : MenuParametrage;
            part messages : Message[0..*];
            part compte : Compte;
            part parametres : Parametres[0..*];
        }
    }
}
