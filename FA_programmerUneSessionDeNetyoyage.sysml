package AspiCoo_Programmer {

    private import ScalarValues::Boolean;

    action fluxProgrammerSession {

        attribute boutonProgrammerAppuye : Boolean;
        attribute parametresValides : Boolean;

        action afficherInterfaceProgrammation;
        action recevoirParametres;
        action verifierParametres;
        action afficherMessageErreur;
        action enregistrerSession;
        action afficherConfirmation;

        merge repriseSaisie;
        decide decision0;

        first start;

        succession start if boutonProgrammerAppuye then afficherInterfaceProgrammation;

        then repriseSaisie;
        then recevoirParametres;
        then verifierParametres;

        then decide decision0;

        if parametresValides then enregistrerSession;
        if not parametresValides then afficherMessageErreur;

        succession afficherMessageErreur then repriseSaisie;

        succession enregistrerSession then afficherConfirmation;

        then done;
    }
}