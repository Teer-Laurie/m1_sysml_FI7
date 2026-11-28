package SequencesRAL_Lancer {

    package parts {
        part def Utilisateur;
        part def ApplicationMobile;
        part def GestionnaireCommunication;
        part def ModulePilotage;
        part def ModuleCartographie;
        part def Capteurs;
        part def Station;
    }

    package sequences {

        private import SequencesRAL_Lancer::parts::*;

        /* A : scénario nominal */
        occurrence lancerNettoyageNominal {
            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part communication : GestionnaireCommunication;
            part pilotage : ModulePilotage;
            part cartographie : ModuleCartographie;
            part capteurs : Capteurs;
            part station : Station;

            message demanderNettoyage from utilisateur to application;
            message transmettreDemande from application to communication;
            message relayerDemande from communication to pilotage;
            message verifierSession from pilotage to pilotage;
            message demanderCarte from pilotage to cartographie;
            message transmettreCarte from cartographie to pilotage;
            message analyserSurface from pilotage to capteurs;
            message typeSurface from capteurs to pilotage;
            message effectuerNettoyage from pilotage to pilotage;
            message verifierFinNettoyage from pilotage to pilotage;
            message retournerStation from pilotage to station;
            message notifierFin from pilotage to communication;
            message relayerNotification from communication to application;
            message afficherFinNettoyage from application to utilisateur;
        }

        /* B : retour à la station en cours de nettoyage */
        occurrence lancerNettoyageRetourStation {
            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part communication : GestionnaireCommunication;
            part pilotage : ModulePilotage;
            part cartographie : ModuleCartographie;
            part capteurs : Capteurs;
            part station : Station;

            message demanderNettoyage from utilisateur to application;
            message transmettreDemande from application to communication;
            message relayerDemande from communication to pilotage;
            message verifierSession from pilotage to pilotage;
            message demanderCarte from pilotage to cartographie;
            message transmettreCarte from cartographie to pilotage;
            message analyserSurface from pilotage to capteurs;
            message typeSurface from capteurs to pilotage;
            message effectuerNettoyage from pilotage to pilotage;
            message batterieFaibleOuReservoirPlein from capteurs to pilotage;
            message retournerStation from pilotage to station;
            message rechargerOuVider from station to pilotage;
            message reprendreNettoyage from pilotage to pilotage;
            message verifierFinNettoyage from pilotage to pilotage;
            message retournerStationFin from pilotage to station;
            message notifierFin from pilotage to communication;
            message relayerNotification from communication to application;
            message afficherFinNettoyage from application to utilisateur;
        }

        /* C : robot hors ligne */
        occurrence lancerNettoyageHorsLigne {
            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part communication : GestionnaireCommunication;

            message demanderNettoyage from utilisateur to application;
            message transmettreDemande from application to communication;
            message verifierConnexionRobot from communication to communication;
            message echecConnexion from communication to application;
            message afficherErreur from application to utilisateur;
        }

        /* D : session déjà en cours */
        occurrence lancerNettoyageSessionEnCours {
            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part communication : GestionnaireCommunication;
            part pilotage : ModulePilotage;

            message demanderNettoyage from utilisateur to application;
            message transmettreDemande from application to communication;
            message relayerDemande from communication to pilotage;
            message verifierSession from pilotage to pilotage;
            message refuserDemande from pilotage to communication;
            message relayerRefus from communication to application;
            message informerSessionEnCours from application to utilisateur;
        }
    }
}
