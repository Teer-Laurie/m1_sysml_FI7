
package RobotAspirateur {

    part robotAspirateur : RobotAspirateur {

        // ==============================
        // BRANCHE SMARTPHONE
        // ==============================

        part smartphone : Smartphone {

            part interactionApplication : InteractionApplication {

                part suiviNettoyage : SuiviNettoyage;

                part maintenancePreventive : MaintenancePreventive {

                    part controlePieces : ControlePieces;

                    part guideChangementPiecesEntretien :
                        GuideChangementPiecesEntretien;
                }

                part tableauDeBord : TableauDeBord;
            }
        }

        // ==============================
        // BRANCHE SAUVEGARDE
        // ==============================

        part sauvegarde : Sauvegarde;


        // ==============================
        // BRANCHE FONCTIONS
        // ==============================

        part fonctions : Fonctions {

            part interactionApplication : InteractionApplication {

                part connexionAvecApplication :
                    ConnexionAvecApplication;
            }

            part aspirerSaletes : AspirerSaletes {

                part niveauSalete : NiveauSalete;
            }

            part deplacementAutonome : DeplacementAutonome {

                part detectionObstacles : DetectionObstacles;
            }

            part cartographierEnvironnement :
                CartographierEnvironnement;
        }


        // ==============================
        // BRANCHE CONTRAINTES
        // ==============================

        part contraintes : Contraintes {

            part cout : Cout;

            part poids : Poids;

            part niveauSonore : NiveauSonore;

            part niveauDetection : NiveauDetection;
        }
    }
}
