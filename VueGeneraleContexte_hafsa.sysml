package RAL_VueGenerale {

    package Parts {
        /* logiciel embarqué du robot */
        part def LogicielRobot;
        part def GestionnaireSession;
        part def Carte;
        part def Zone;
        part def Obstacle;
        part def ModeNettoyage;
        part def Diagnostic;
        part def EtatComposant;
        part def Alerte;

        /* logiciel de la station */
        part def LogicielStation;
        part def GestionnaireEvacuation;
        part def GestionnaireCharge;
        part def NiveauConsommable;

        /* application mobile */
        part def AppRAL;
        part def DialogueConnexion;
        part def CompteUtilisateur;
        part def VueCarte;
        part def DialogueProgrammation;
        part def SessionProgrammee;
        part def DialogueReglage;
        part def Reglage;
        part def GuideEntretien;
        part def Notification;

        /* matériel et système */
        part def RobotNettoyeur;
        part def StationRechargeEvacuation;
        part def SystemeRAL;
    }

    private import Parts::*;

    /* ===== logiciel embarqué du robot ===== */
    part logicielRobot : LogicielRobot {
        part gestionnaireSession : GestionnaireSession;
        part carte : Carte {
            part zones : Zone[1..*];
            part obstacles : Obstacle[0..*];
        }
        part modes : ModeNettoyage[3];          // aspiration, lavage, mixte
        part diagnostic : Diagnostic {
            part etatsComposants : EtatComposant[1..*];
        }
        part alertes : Alerte[0..*];
    }

    /* ===== logiciel de la station ===== */
    part logicielStation : LogicielStation {
        part gestionnaireEvacuation : GestionnaireEvacuation;
        part gestionnaireCharge : GestionnaireCharge;
        part niveaux : NiveauConsommable[3];    // sachet, eau, produit
        part alertes : Alerte[0..*];
    }

    /* ===== application mobile ===== */
    part appSmartphone : AppRAL {
        part dialogueConnexion : DialogueConnexion;
        part compte : CompteUtilisateur;
        part vueCarte : VueCarte;
        part dialogueProgrammation : DialogueProgrammation;
        part sessionsProgrammees : SessionProgrammee[0..*];
        part dialogueReglage : DialogueReglage[1..*];
        part reglages : Reglage[0..*];
        part guideEntretien : GuideEntretien;
        part notifications : Notification[0..*];
    }

    /* ===== architecture d'ensemble ===== */
    part systeme : SystemeRAL {
        part robot : RobotNettoyeur {
            part logiciel :> logicielRobot;
        }
        part station : StationRechargeEvacuation {
            part logiciel :> logicielStation;
        }
        part application :> appSmartphone;
    }
}
