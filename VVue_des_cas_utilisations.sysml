package CasUtilisationRAL {

    package Acteurs {
        part def Utilisateur;
    }

    package CasUtilisation {
        private import Acteurs::*;

        actor utilisateur : Utilisateur;

        use case programmerNettoyage {
            ref actor utilisateur;
        }

        use case lancerNettoyage {
            ref actor utilisateur;
        }

        use case consulterCarte {
            ref actor utilisateur;
        }

        use case gererDechetsEtReservoirs {
            ref actor utilisateur;
        }

        use case effectuerMaintenance {
            ref actor utilisateur;
        }

        use case configurerSysteme {
            ref actor utilisateur;
        }
    }
}