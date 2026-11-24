package ConsulterCarteRAL {

    package parts {
        part def Utilisateur;
        part def InterfaceApplication;
        part def GestionnaireCommunication;
        part def ModuleCartographie;

        item def Carte;
        item def Zones;
        item def Confirmation;
    }

    private import ConsulterCarteRAL::parts::*;

    package sequences {

        /* Scénario A : consultation simple */
        occurrence consulterCarteS1 {
            part utilisateur : Utilisateur;
            part interfaceApplication : InterfaceApplication;
            part gestionnaireCommunication : GestionnaireCommunication;
            part moduleCartographie : ModuleCartographie;

            message ouvrirApplication from utilisateur to interfaceApplication;
            message demanderCarte from utilisateur to interfaceApplication;
            message requeteCarte from interfaceApplication to gestionnaireCommunication;
            message lireCarteCourante from gestionnaireCommunication to moduleCartographie;
            message carteLue of Carte from moduleCartographie to gestionnaireCommunication;
            message carteTransmise of Carte from gestionnaireCommunication to interfaceApplication;
            message afficherCarte from interfaceApplication to utilisateur;
        }

        /* Scénario B : modification des zones */
        occurrence consulterCarteS2 {
            part utilisateur : Utilisateur;
            part interfaceApplication : InterfaceApplication;
            part gestionnaireCommunication : GestionnaireCommunication;
            part moduleCartographie : ModuleCartographie;

            message ouvrirApplication from utilisateur to interfaceApplication;
            message demanderCarte from utilisateur to interfaceApplication;
            message requeteCarte from interfaceApplication to gestionnaireCommunication;
            message lireCarteCourante from gestionnaireCommunication to moduleCartographie;
            message carteLue of Carte from moduleCartographie to gestionnaireCommunication;
            message carteTransmise of Carte from gestionnaireCommunication to interfaceApplication;
            message afficherCarte from interfaceApplication to utilisateur;

            message choisirZones from utilisateur to interfaceApplication;
            message validerZones from utilisateur to interfaceApplication;
            message envoyerZones of Zones from interfaceApplication to gestionnaireCommunication;
            message enregistrerZones of Zones from gestionnaireCommunication to moduleCartographie;
            message confirmationEnregistrement of Confirmation from moduleCartographie to gestionnaireCommunication;
            message confirmationTransmise of Confirmation from gestionnaireCommunication to interfaceApplication;
            message afficherConfirmation from interfaceApplication to utilisateur;
        }

        /* Scénario C : robot hors ligne */
        occurrence consulterCarteS3 {
            part utilisateur : Utilisateur;
            part interfaceApplication : InterfaceApplication;
            part gestionnaireCommunication : GestionnaireCommunication;

            message ouvrirApplication from utilisateur to interfaceApplication;
            message demanderCarte from utilisateur to interfaceApplication;
            message requeteCarte from interfaceApplication to gestionnaireCommunication;
            message echecConnexion from gestionnaireCommunication to interfaceApplication;
            message afficherMessageErreur from interfaceApplication to utilisateur;
        }
    }
}