#!/bin/bash
#******************************************************************************
# KickPi-OS Install Script - Optimized Version
#******************************************************************************

#--- Farben & Variablen ---
      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
NC='\033[0m' # No Color

USER_HOME="/home/$USER"
KICKPI_SRC="$USER_HOME/KickPi-OS"
OPT_KICKPI="/opt/KickPi-OS"
AMIGA_DIR="/opt/Amiga"
BACKUP_DIR="/opt/Backup"

#--- Funktionen ---
msg() { echo -e "${BLUE}[*]${NC} $1"; }
error() { echo -e "${RED}[!] ERROR:${NC} $1"; exit 1; }

# Prüfen, ob Sourcedateien existieren
[[ -d "$KICKPI_SRC" ]] || error "Source-Verzeichnis $KICKPI_SRC nicht gefunden!"

#--- Vorbereitung ---
msg "Erstelle Verzeichnisse und setze Berechtigungen..."
sudo mkdir -p "$BACKUP_DIR" "$AMIGA_DIR"
sudo chown -R $USER:$USER "$KICKPI_SRC" "$BACKUP_DIR"

#--- OLED Installation ---
if [[ ! -f "$USER_HOME/OLED.txt" ]]; then
    sudo cp -f "$OPT_KICKPI/OLED/OLED.txt" "$USER_HOME/" 2>/dev/null
    
    if dialog --title "OLED Display" --backtitle "KickPi-OS Setup" \
              --yesno "Ist ein OLED Display installiert?\n(Antwort 'Nein' verhindert Remote I/O Errors)" 10 60; then
        msg "OLED wird konfiguriert..."
        sudo cp -rf "$KICKPI_SRC/OLED/" /OLED
        sudo chmod -R 755 /OLED
        # loop.sh nur ausführen, wenn vorhanden
        command -v loop.sh >/dev/null && loop.sh & 
    else
        msg "OLED deaktiviert."
        sudo rm -rf /OLED
    fi
fi

#--- System-Konfiguration kopieren ---
msg "Kopiere System-Konfigurationen..."
sudo cp -R "$KICKPI_SRC/scripts/"* /usr/local/bin/ sudo chmod +x /usr/local/bin/*.sh 2>/dev/null

# Splash & Desktop-Icons
sudo cp "$OPT_KICKPI/config/splash/"* /etc/systemd/system/ 2>/dev/null sudo rm -rf /usr/share/applications/*Ami* sudo cp -R "$KICKPI_SRC/config/Desktop/"* /usr/share/applications/ sudo cp -rf "$KICKPI_SRC/config/Backgrounds/"* /usr/share/backgrounds/

# Samba Installation
msg "Installiere Netzwerk-Dienste..."
sudo apt update && sudo apt install -y samba cifs-utils toilet

#--- UI Intro ---
clear
toilet "KickPi-OS" --metal
echo -e "${GREY}KickPI-OS ROM Operating System and Libraries"
echo "Version V2.0 (Optimized) | No Rights Reserved.${NC}\n"

#--- System Update ---
msg "Linux System Update (kann dauern)..."
sudo apt upgrade -y

#--- Autostart ---
mkdir -p "$USER_HOME/.config/autostart/"
cp -f "$OPT_KICKPI/config/Desktop/KickPi-OS_Setup.desktop" "$USER_HOME/.config/autostart/"

#--- Backup & Cleanup ---
msg "Bereinige Amiga-Dateien..."
[[ -d "$AMIGA_DIR/amiberry" ]] && sudo cp -rf "$AMIGA_DIR/amiberry" "$BACKUP_DIR/"
[[ -d "$AMIGA_DIR/amiberry_dev" ]] && sudo cp -rf "$AMIGA_DIR/amiberry_dev" "$BACKUP_DIR/"

# Unnötige Dateien entfernen (Mac/Windows Reste) 
find "$USER_HOME" "$AMIGA_DIR" /opt/ -type f \( -name "._*" -o -name ".DS_*" -o -name "_UAEFSDB.___" -o -name "*.uaem" \) -delete 2>/dev/null



#--- Rechte-Fix (Sauberer als 777) ---
msg "Setze finale Dateirechte..."
sudo chown -R $USER:$USER "$USER_HOME"
sudo chmod -R 755 /usr/local/bin/
sudo chmod -R 755 "$AMIGA_DIR"



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
