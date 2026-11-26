package SequencesRAL_Dechets {

    package parts {
        part def Utilisateur;
        part def ApplicationMobile;
        part def RobotNettoyeur;
        part def ReservoirDechets;
        part def Station;
        part def SachetDechets;
        part def ReservoirsLiquides;

        item def Dechets;
        item def Alerte;
    }

    package sequences {

        private import SequencesRAL_Dechets::parts::*;

        /* scénario nominal : sachet présent, sachet plein, liquides suffisants */
        occurrence gererDechetsNominal {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;
            part reservoir : ReservoirDechets;
            part station : Station;
            part sachet : SachetDechets;
            part liquides : ReservoirsLiquides;

            // compactage pendant le nettoyage (EF-19)
            message collecterDechets of Dechets from robot to reservoir;
            message compacterDechets from reservoir to reservoir;

            // retour et transfert (EF-20, EF-21, EF-27)
            message accosterStation from robot to station;
            message verifierPresenceSachet from station to sachet;
            message sachetPresent from sachet to station;
            message viderReservoir of Dechets from reservoir to station;
            message transfererDechets of Dechets from station to sachet;

            // sachet plein (EF-31, EF-22)
            message mesurerNiveauSachet from station to sachet;
            message sachetPlein from sachet to station;
            message signalerSachetPlein of Alerte from station to application;
            message notifierSachetPlein of Alerte from application to utilisateur;
            message retirerSachetPlein from utilisateur to station;

            // contrôle des liquides (EF-23, EF-32)
            message mesurerNiveauxLiquides from station to liquides;
            message niveauxSuffisants from liquides to station;
        }

        /* scénario alternatif : sachet absent (EF-27) */
        occurrence gererDechetsSachetAbsent {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part robot : RobotNettoyeur;
            part station : Station;
            part sachet : SachetDechets;

            message accosterStation from robot to station;
            message verifierPresenceSachet from station to sachet;
            message sachetAbsent from sachet to station;
            message suspendreTransfert from station to station;
            message signalerSachetAbsent of Alerte from station to application;
            message notifierSachetAbsent of Alerte from application to utilisateur;
            message placerSachet from utilisateur to station;
            message reverifierPresenceSachet from station to sachet;
            message sachetPresent from sachet to station;
        }

        /* scénario alternatif : niveau de liquide bas (EF-32) */
        occurrence gererDechetsNiveauLiquideBas {

            part utilisateur : Utilisateur;
            part application : ApplicationMobile;
            part station : Station;
            part liquides : ReservoirsLiquides;

            message mesurerNiveauxLiquides from station to liquides;
            message niveauBas from liquides to station;
            message signalerNiveauBas of Alerte from station to application;
            message notifierNiveauBas of Alerte from application to utilisateur;
            message remplirReservoirs from utilisateur to liquides;
            message remesurerNiveaux from station to liquides;
            message niveauxSuffisants from liquides to station;
        }
    }
}
