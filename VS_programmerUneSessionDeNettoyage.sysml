package AspiCoo_Programmer {

    package parts {
        part def InterfaceUtilisateur;
        part def RobotAspirateur;
        part def ModuleProgrammation;
        part def BaseDeDonnees;
    }

    package sequences {

        private import AspiCoo_Programmer::parts::*;

        occurrence sequenceProgrammerSession {

            // Yaşam hatları (Lifelines)
            part interfaceUtilisateur: InterfaceUtilisateur;
            part robot: RobotAspirateur;
            part moduleProgrammation: ModuleProgrammation;
            part bdd: BaseDeDonnees;

            // 1. Kullanıcının butona basması ve arayüzün açılması
            message appuyerBoutonProgrammer from interfaceUtilisateur to robot;
            message afficherInterfaceProgrammation from robot to interfaceUtilisateur;

            // 2. Kullanıcının parametreleri girmesi ve doğrulanması
            message saisirParametres from interfaceUtilisateur to moduleProgrammation;
            message verifierParametresSession from moduleProgrammation to moduleProgrammation;

            // 3. Alternatif Akış: Parametreler Geçersizse (parametresInvalides)
            message notifierParametresInvalides from moduleProgrammation to interfaceUtilisateur;
            message afficherMessageErreur from interfaceUtilisateur to interfaceUtilisateur;

            // 4. Ana Akış: Parametreler Geçerliyse (parametresValides)
            message enregistrerSession from moduleProgrammation to bdd;
            message confirmerEnregistrement from bdd to moduleProgrammation;

            // 5. Kullanıcıya bildirim ve tamamlama
            message notifierSuccesProgrammation from moduleProgrammation to interfaceUtilisateur;
            message afficherConfirmation from interfaceUtilisateur to interfaceUtilisateur;
        }
    }
}