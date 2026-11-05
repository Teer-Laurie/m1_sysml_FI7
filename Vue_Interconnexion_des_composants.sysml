package vueInterconnexion {

    /* types de ports */
    port def PortAlimentation;
    port def PortCommande;
    port def PortCapteur;
    port def PortDonnees;
    port def PortWifi;

    /* définitions des composants */
    part def SystemeRobotAspirateur;
    part def Robot;
    part def CarteMere;
    part def MicroControleur;
    part def ModuleWifi;
    part def Memoire;
    part def Batterie;
    part def MoteurAspiration;
    part def MoteurRoue;
    part def CapteurObstacle;
    part def CapteurLidar;
    part def ReseauWifi;
    part def Smartphone;
    part def Application;

    part systeme : SystemeRobotAspirateur {

        /* ===== Robot ===== */
        part robot : Robot {
            port wifi : PortWifi;

            part batterie : Batterie {
                port alimentation : PortAlimentation;
            }

            part carteMere : CarteMere {
                part microControleur : MicroControleur {
                    port alimentation : PortAlimentation;
                    port commandeAspiration : PortCommande;
                    port commandeRoues : PortCommande;
                    port entreeObstacles : PortCapteur;
                    port entreeLidar : PortCapteur;
                    port donneesMemoire : PortDonnees;
                    port donneesWifi : PortDonnees;
                }
                part memoire : Memoire {
                    port donnees : PortDonnees;
                }
                part moduleWifi : ModuleWifi {
                    port donnees : PortDonnees;
                    port antenne : PortWifi;
                }

                connect microControleur.donneesMemoire to memoire.donnees;
                connect microControleur.donneesWifi to moduleWifi.donnees;
            }

            part moteurAspiration : MoteurAspiration {
                port commande : PortCommande;
            }
            part moteursRoues : MoteurRoue[2] {
                port commande : PortCommande;
            }
            part capteursObstacles : CapteurObstacle[1..*] {
                port mesure : PortCapteur;
            }
            part capteurLidar : CapteurLidar {
                port mesure : PortCapteur;
            }

            /* alimentation */
            connect batterie.alimentation to carteMere.microControleur.alimentation;

            /* commandes des actionneurs */
            connect carteMere.microControleur.commandeAspiration to moteurAspiration.commande;
            connect carteMere.microControleur.commandeRoues to moteursRoues.commande;

            /* remontée des capteurs */
            connect capteursObstacles.mesure to carteMere.microControleur.entreeObstacles;
            connect capteurLidar.mesure to carteMere.microControleur.entreeLidar;

            /* sortie WiFi du robot */
            connect carteMere.moduleWifi.antenne to wifi;
        }

        /* ===== Réseau WiFi ===== */
        part reseauWifi : ReseauWifi {
            port coteRobot : PortWifi;
            port coteSmartphone : PortWifi;
        }

        /* ===== Smartphone ===== */
        part smartphone : Smartphone {
            port wifi : PortWifi;
            part application : Application {
                port communication : PortWifi;
            }
            connect application.communication to wifi;
        }

        /* liaisons entre robot, réseau et smartphone */
        connect robot.wifi to reseauWifi.coteRobot;
        connect reseauWifi.coteSmartphone to smartphone.wifi;
    }
}
