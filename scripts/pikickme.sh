#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021 
#*************************************************************************************************************

# Farben definieren
BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'

# Verzeichnisse erstellen
sudo mkdir -p /opt/Backup /opt/Amiga

# Berechtigungen setzen
sudo chmod -R 777 /home/$USER/KickPi-OS /opt/Backup/

# OLED-Installation
if [ ! -f /home/$USER/OLED.txt ]; then
    sudo cp -rf /opt/KickPi-OS/OLED/OLED.txt /home/$USER/
    dialog --title "Did you have a OLED Display installed?" \
           --backtitle "KichPi-OS OLED switcher" \
           --yesno "\n If you don't have a OLED Display,\n please answer with no.\n\n <Errno 121 Remote I/O error>" 10 60
    response=$?

    case $response in
        1) 
            echo "OLED disabled...."
            sudo rm -rf /OLED
            ;;
        0) 
            echo "Ok, OLED is installed"
            sudo cp -rf /home/$USER/KickPi-OS/OLED/ /
            sudo chmod -R 777 /OLED/
            loop.sh
            ;;
        255) 
            echo "[ESC] key pressed."
            ;;
    esac
fi

# Kopieren von Skripten und Konfigurationen
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
sudo cp /opt/KickPi-OS/config/splash/* /etc/systemd/system/
sudo rm -rf /usr/share/applications/*Ami*
sudo cp -R /home/$USER/KickPi-OS/config/Desktop/* /usr/share/applications/
sudo cp -rf /home/$USER/KickPi-OS/config/Backgrounds/* /usr/share/backgrounds/
sudo apt install -y samba cifs-utils

# System aktualisieren
clear
toilet "KickPi-OS" --metal
echo -e "$GREY KickPI-OS ROM Operating System and Libraries"
echo " Version V2.0 2020-2021 KickPi-OS "
echo " No Rights Reserved.  "
echo " "

# OLED-Installation erneut prüfen
if [ -d /OLED/ ]; then
    sudo cp -rf /home/$USER/KickPi-OS/OLED/ /
    sudo chmod -R 777 /OLED/
fi

# Autostart-Verzeichnis erstellen
mkdir -p /home/$USER/.config/autostart/
sudo cp -rf /opt/KickPi-OS/config/Desktop/KickPi-OS_Setup.desktop /home/$USER/.config/autostart/

# System aktualisieren
echo -e "$BLUE\nKickPi-OS Update Linux System ..."
sudo apt-get update
sudo apt-get upgrade -y

# Update-Skripte ausführen
if [ -d /OLED/ ]; then
    update.sh
fi

# Verzeichnisse und Dateien verwalten
cd /home/$USER/KickPi-OS/


# Backup und Bereinigung
sudo cp -rf /opt/Amiga/amiberry /opt/Backup/
sudo cp -rf /opt/Amiga/amiberry_dev /opt/Backup/


# Berechtigungen reparieren
sudo chmod -R 777 /usr/local/bin/ /home/$USER/.config/ /home/$USER/.local/ /home/$USER/Desktop/ /usr/share/applications/ /opt/

# Dienste deaktivieren
if [ -f /etc/systemd/pstore.conf ]; then
    for service in apt-daily-upgrade.service apt-daily-upgrade.timer apt-daily.service apt-daily.timer cups rsyslog.service syslog.socket webmin glamor-test.service man-db.service man-db.timer plymouth-reboot.service plymouth-start.service alsa-restore.service alsa-state.service; do
        sudo systemctl disable $service
    done
    sudo rm -rf /etc/systemd/pstore.conf
fi

# KickPi-OS starten
if [ -d /OLED/ ]; then
    KickPi-OS.sh
fi
  sudo rm -rf /home/$USER/.bashrc
  cp -rf /opt/KickPi-OS/scripts/bashrc /home/$USER/.bashrc

  echo " "
  echo "  ... cleanup Amiga folder  " 
  sudo chmod -R 777 /home/$USER/Amiga
  echo " "
  echo "  ... delete unnecessary files  " 
  cd ~
  sudo find . -name "\._*" -type f -print0 | xargs -0 /bin/rm -f
  sudo find . -name "\.DS_*" -type f -print0 | xargs -0 /bin/rm -f
  sudo find . -name "_UAEFSDB.___" -type f -print0 | xargs -0 /bin/rm -f
  sudo find . -name "*.uaem" -type f -print0 | xargs -0 /bin/rm -f
  cd /opt/
  sudo find . -name "\._*" -type f -print0 | xargs -0 /bin/rm -f
  sudo find . -name "\.DS_*" -type f -print0 | xargs -0 /bin/rm -f
  sudo find . -name "_UAEFSDB.___" -type f -print0 | xargs -0 /bin/rm -f
  sudo find . -name "*.uaem" -type f -print0 | xargs -0 /bin/rm -f
  cd ~
  #sudo rm -rf ~/.cache/
  sudo rm -rf ~/KickPi-OS
  sudo rm -rf ~/Templates/*
  cp -rf  /opt/Backup/amiberry_dev /home/$USER/Amiga


  echo " "
  echo "  ... repair rights  "         

  
  sudo chmod -R 777 /usr/local/bin/
  sudo chmod -R 777 /home/$USER/.config/
  sudo chmod -R 777 /home/$USER/.local/
  sudo chmod -R 777 /home/$USER/Desktop/
  sudo chmod -R 777 /usr/share/applications/
  sudo chmod -R 777 /opt/
  
  echo " "
  echo "  ... finish setup  " 
     

# Benutzeroberfläche anzeigen
clear
toilet "KickPi-OS" --metal
echo -e "$BLUE KickPI-OS ROM Operating System and Libraries"
echo " Version V2.0 2020-2021 KickPi-OS "
echo " No Rights Reserved.  "
echo -e "$BLACK "
echo " Type 'd' to boot into Kick-OS Workbench"
echo ""
echo " 1.>  "
echo -e " 1.>  ( a ) Start Amiga                   *Amiberry*" 
echo " 1.>  ( d ) KickPi Desktop                          " 
echo -e " 1.>  ( e ) Emulationstation              *RetroPie*" 
echo " 1.>  ( r ) Emulationstation Setup                  "
echo -e "$GREEN 1.>  ( u ) KickPi-OS Update                        "
echo -e "$BLACK 1.>  ( m ) KickPi-OS Config                        " 
echo -e " 1.>  ( c ) Raspi-Config                            "
echo " 1.>  ( s ) Shutdown                                 " 
