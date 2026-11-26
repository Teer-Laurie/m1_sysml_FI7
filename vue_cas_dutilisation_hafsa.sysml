package robotAspirateur {
    private import ScalarValues::Boolean;

    package parts {
        /* acteurs */
        part def Utilisateur;
        part def Administrateur :> Utilisateur;

        /* système d'intérêt */
        part def RobotNettoyeur;
        part def StationRechargeEvacuation;
        part def ApplicationMobile;
    }

    package useCases {
        private import robotAspirateur::parts::*;

        actor utilisateur : Utilisateur;
        actor administrateur : Administrateur ::> utilisateur;

        use case lancerNettoyage {
            ref actor utilisateur;
        }
        use case programmerNettoyage {
            ref actor utilisateur;
        }
        use case consulterCarte {
            ref actor utilisateur;
        }
        use case choisirZonesANettoyer {
            ref actor utilisateur;
        }
        use case recevoirNotifications {
            ref actor utilisateur;
        }
        use case viderSachetDechets {
            ref actor utilisateur;
        }
        use case remplirReservoirs {
            ref actor utilisateur;
        }
        use case effectuerMaintenance {
            ref actor utilisateur;
        }
        use case configurerSysteme {
            ref actor administrateur;
        }
    }
}
