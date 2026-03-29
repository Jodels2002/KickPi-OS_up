#!/bin/bash
#******************************************************************************
# KickPi-OS Install Script 
#******************************************************************************

sudo remove -cf /home/$USER/Amiga
sudo ln -s /opt/Amiga/ /home/$USER/Amiga


#********************************************
# Raspberry Pi HDD auf Pin 27
#********************************************
if ! grep -q "^dtparam=act_led_gpio=27" /boot/firmware/config.txt; then
    echo "dtparam=act_led_gpio=27" | sudo tee -a /boot/firmware/config.txt > /dev/null
fi


#--- Farben ---
BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'
NC='\033[0m'

#--- Variablen ---
USER_HOME="/home/$USER"
KICKPI_SRC="$USER_HOME/KickPi-OS"
OPT_KICKPI="/opt/KickPi-OS"
AMIGA_DIR="/opt/Amiga"
BACKUP_DIR="/opt/Backup"

#--- Funktionen ---
msg() { echo -e "${BLUE}[*]${NC} $1"; }
error() { echo -e "${RED}[!] ERROR:${NC} $1"; exit 1; }

#--- Checks ---
[[ -d "$KICKPI_SRC" ]] || error "Source-Verzeichnis $KICKPI_SRC nicht gefunden!"

#--- Bashrc ersetzen ---
msg "Setze neue Bashrc..."
sudo install -m 644 "$OPT_KICKPI/scripts/bashrc" "$USER_HOME/.bashrc"

#--- Verzeichnisse ---
msg "Erstelle Verzeichnisse..."
sudo mkdir -p "$BACKUP_DIR" "$AMIGA_DIR"
sudo chown -R "$USER:$USER" "$KICKPI_SRC" "$BACKUP_DIR"

#--- OLED Installation ---
 sudo cp -rf /home/$USER/KickPi-OS/OLED/ /
 
if [[ ! -f "$USER_HOME/OLED.txt" ]]; then
    sudo cp -f "$OPT_KICKPI/OLED/OLED.txt" "$USER_HOME/"

    if dialog --title "OLED Display" --backtitle "KickPi-OS Setup" \
              --yesno "Ist ein OLED Display installiert?" 10 60; then
        msg "OLED wird konfiguriert..."
        sudo rsync -a "$KICKPI_SRC/OLED/" /OLED/
        sudo chmod -R 777 /OLED
        [[ -x /OLED/loop.sh ]] && /OLED/loop.sh &

        # Definieren des Jobs
JOB="*/5 * * * * /usr/local/bin/loop.sh"

# Nur hinzufügen, wenn er noch nicht drin steht
(crontab -l 2>/dev/null | grep -Fq "$JOB") || (crontab -l 2>/dev/null; echo "$JOB") | crontab -

    else
        msg "OLED deaktiviert."
        sudo rm -rf /OLED
    fi
fi

#--- Systemskripte installieren ---
msg "Installiere Systemskripte..."
sudo cp -r "$KICKPI_SRC/scripts/"*.sh /usr/local/bin/

#--- UI Intro ---
clear
toilet "KickPi-OS" --metal
echo -e "${GREY}KickPI-OS ROM Operating System and Libraries"
echo -e "Version V2.0 (Optimized)${NC}\n"

#--- Desktop & Splash ---
msg "Installiere Desktop-Konfiguration..."
sudo cp -f "$OPT_KICKPI/config/splash/"* /etc/systemd/system/ 2>/dev/null || true
sudo rm -f /usr/share/applications/*Ami*
sudo cp -r "$KICKPI_SRC/config/Desktop/"* /usr/share/applications/
sudo cp -r "$KICKPI_SRC/config/Backgrounds/"* /usr/share/backgrounds/

CFG="/opt/retropie/configs/all/retropie_settings.cfg"

# Falls Datei existiert, Splashscreen deaktivieren
if [ -f "$CFG" ]; then
    sudo sed -i 's/splashscreen_enabled=.*/splashscreen_enabled=0/' "$CFG"
    echo "RetroPie Splashscreen wurde deaktiviert."
else
    echo "Konfigurationsdatei nicht gefunden."
fi

#--- UI Intro ---
clear
toilet "KickPi-OS" --metal
echo -e "${GREY}KickPI-OS ROM Operating System and Libraries"
echo -e "Version V2.0 (Optimized)${NC}\n"

#--- Netzwerkdienste ---
msg "Installiere Netzwerk-Dienste..."

sudo apt install -y samba cifs-utils htop 

sudo cp -r /opt/KickPi-OS/config/smb.conf /etc/samba/smb.conf

#--- UI Intro ---
clear
toilet "KickPi-OS" --metal
echo -e "${GREY}KickPI-OS ROM Operating System and Libraries"
echo -e "Version V2.0 (Optimized)${NC}\n"

#--- System Update ---
msg "System wird aktualisiert..."
sudo apt upgrade -y

#--- UI Intro ---
clear
toilet "KickPi-OS" --metal
echo -e "${GREY}KickPI-OS ROM Operating System and Libraries"
echo -e "Version V2.0 (Optimized)${NC}\n"

#--- Rechte ---
msg "Setze Dateirechte..."
sudo chmod -R 777 /home/
sudo chmod -R 777 /usr/local/
sudo chmod -R 777 /opt/

#--- UI Intro ---
clear
toilet "KickPi-OS" --metal
echo -e "${GREY}KickPI-OS ROM Operating System and Libraries"
echo -e "Version V2.0 (Optimized)${NC}\n"

#--- Autostart ---
msg "Autostart konfigurieren..."
mkdir -p "$USER_HOME/.config/autostart/"
cp -f "$OPT_KICKPI/config/Desktop/KickPi-OS_Setup.desktop" "$USER_HOME/.config/autostart/"

#--- Backup & Cleanup ---
msg "Backup & Cleanup..."
[[ -d "$AMIGA_DIR/amiberry" ]] && sudo cp -r "$AMIGA_DIR/amiberry" "$BACKUP_DIR/"
[[ -d "$AMIGA_DIR/amiberry_dev" ]] && sudo cp -r "$AMIGA_DIR/amiberry_dev" "$BACKUP_DIR/"

find "$USER_HOME" "$AMIGA_DIR" /opt/ -type f \
     \( -name "._*" -o -name ".DS_*" -o -name "_UAEFSDB.___" -o -name "*.uaem" \) \
     -delete
#--- UI Intro ---
clear
toilet "KickPi-OS" --metal
echo -e "${GREY}KickPI-OS ROM Operating System and Libraries"
echo -e "Version V2.0 (Optimized)${NC}\n"

#--- Dienste deaktivieren (nur wenn vorhanden) ---
msg "Deaktiviere unnötige Dienste..."

disable_if_exists() {
    systemctl list-unit-files | grep -q "$1" && sudo systemctl disable "$1" 2>/dev/null || true
}

disable_if_exists apt-daily-upgrade.service
disable_if_exists apt-daily-upgrade.timer
disable_if_exists apt-daily.service
disable_if_exists apt-daily.timer
disable_if_exists cups
disable_if_exists rsyslog.service
disable_if_exists syslog.socket
disable_if_exists glamor-test.service
disable_if_exists man-db.service
disable_if_exists man-db.timer
disable_if_exists plymouth-start.service
disable_if_exists plymouth-reboot.service
disable_if_exists alsa-restore.service
disable_if_exists alsa-state.service
disable_if_exists NetworkManager-dispatcher.service
#disable_if_exists splashscreen.service
disable_if_exists asplashscreen.service

#!/bin/bash
# Disable all Raspberry Pi power saving features
# Optimiert für Debian Bookworm/Trixie



echo "[INFO] Deaktiviere Bildschirm-Timeout…"
sudo sed -i '/^BLANK_TIME/d' /etc/xdg/lxsession/LXDE-pi/autostart 2>/dev/null || true
sudo sed -i '/^@xset s/d' /etc/xdg/lxsession/LXDE-pi/autostart 2>/dev/null || true

sudo bash -c 'cat >> /etc/xdg/lxsession/LXDE-pi/autostart <<EOF
@xset s off
@xset -dpms
@xset s noblank
EOF'

echo "[INFO] Deaktiviere Konsolen-Blanking…"
sudo sed -i 's/^BLANK_TIME=.*/BLANK_TIME=0/' /etc/kbd/config || \
sudo bash -c 'echo "BLANK_TIME=0" >> /etc/kbd/config'

sudo systemctl restart keyboard-setup.service || true

echo "[INFO] Deaktiviere WLAN Power Saving…"
if command -v iw >/dev/null; then
    IFACE=$(iw dev | awk '$1=="Interface"{print $2}')
    if [[ -n "$IFACE" ]]; then
        sudo iw dev "$IFACE" set power_save off || true
    fi
fi

# dauerhaft abschalten
sudo bash -c 'cat > /etc/NetworkManager/conf.d/wifi-powersave.conf <<EOF
[connection]
wifi.powersave = 2
EOF'

echo "[INFO] Deaktiviere USB Autosuspend…"
sudo sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="usbcore.autosuspend=-1"/' /etc/default/grub || true
sudo update-grub || true

echo "[INFO] Deaktiviere systemd Sleep Targets…"
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

echo "[INFO] Raspberry Pi bleibt jetzt dauerhaft wach."




#--- UI ---
clear
toilet "KickPi-OS" --metal
echo -e "$BLUE KickPI-OS ROM Operating System and Libraries"
echo " Version V2.0 2020-2021 KickPi-OS "
echo " No Rights Reserved."
echo -e "$BLACK"
echo " Type 'd' to boot into Kick-OS Workbench"
echo ""
echo " 1.>  ( a ) Start Amiga (Amiberry)"
echo " 1.>  ( d ) KickPi Desktop"
echo " 1.>  ( e ) Emulationstation (RetroPie)"
echo " 1.>  ( r ) Emulationstation Setup"
echo -e "$GREEN 1.>  ( u ) KickPi-OS Update"
echo -e "$BLACK 1.>  ( m ) KickPi-OS Config"
echo " 1.>  ( c ) Raspi-Config"
echo " 1.>  ( s ) Shutdown"
sudo rm -f /etc/systemd/pstore.conf /etc/systemd/journald.conf
