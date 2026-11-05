package AspiCoo {

    package parts {

        part def Utilisateur;

    }

    package useCases {

        private import AspiCoo::parts::*;

        actor utilisateur : Utilisateur;

        use case configurerSysteme {
            ref actor utilisateur;
        }


        use case cartographierEnvironnement {
            ref actor utilisateur;
        }


        use case programmerSessionNettoyage {
            ref actor utilisateur;
        }

        use case lancerNettoyage {
            ref actor utilisateur;
        }

        use case entretenirSysteme {
            ref actor utilisateur;
        }

    }
}