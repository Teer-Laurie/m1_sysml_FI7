package robotAspirateur {
    private import ScalarValues::Boolean;

    package parts {
        /* acteurs */
        part def Utilisateur;

        /* contexte */
        part def robotAspirateur;
        part def SmartPhone;
        part def BoxWifi;
        part def BacDechets;
        part def ReservoirEau;
    }

    package useCases {
        private import robotAspirateur::parts::*;

        actor utilisateur:Utilisateur;

        use case connecterSmartphoneAuRobot {
            ref actor utilisateur;
        }

        use case connecterRobotAuWifi {
            ref actor utilisateur;
        }

        use case creerOuConsulterCartographie {
            ref actor utilisateur;
        }

        use case configurerSessionNettoyage {
            ref actor utilisateur;
        }

        use case viderBacDechets {
            ref actor utilisateur;
        }

        use case verifierEtRemplirReservoir {
            ref actor utilisateur;
        }

        use case automatiserNettoyage {
            ref actor utilisateur;
        }

        use case choisirSurfaceANettoyer {
            ref actor utilisateur;
        }

        use case lancerNettoyage {
            ref actor utilisateur;
        }
    }
}