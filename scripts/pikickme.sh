#!/bin/bash
#******************************************************************************
# KickPi-OS Install Script 
#******************************************************************************

sudo rm -rf /home/$USER/Amiga
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

echo "== Prüfe ob OLED erkannt wird =="

OLED_FOUND=0
INSTALL_OLED=0

# --- Hardware-Erkennung ---
if [[ -e /dev/i2c-1 ]]; then
    if command -v i2cdetect >/dev/null 2>&1; then

        if i2cdetect -y 1 2>/dev/null | grep -qiE "3c|3d"; then
            echo "OLED automatisch erkannt ✔"
            OLED_FOUND=1
        else
            echo "Kein OLED erkannt"
        fi

    else
        echo "WARNUNG: i2c-tools nicht installiert (keine Erkennung möglich)"
    fi
else
    echo "WARNUNG: I2C nicht aktiv"
fi


# --- Entscheidungslogik ---
if [[ "$OLED_FOUND" -eq 1 ]]; then
    echo "→ Automatische Konfiguration wird verwendet"
    INSTALL_OLED=1
else
    echo "→ Manuelle Abfrage erforderlich"
    OLED_FOUND=0
    INSTALL_OLED=0

fi


# --- Ausführung ---
if [[ "$INSTALL_OLED" -eq 1 ]]; then

    msg "OLED wird konfiguriert..."

    # Marker setzen
    sudo cp -f "$OPT_KICKPI/OLED/OLED.txt" "$USER_HOME/"

    # Dateien kopieren
    sudo rsync -a "$KICKPI_SRC/OLED/" /OLED/

    # Rechte setzen
    sudo chmod -R 755 /OLED

    echo "OLED Setup abgeschlossen ✔"

else

    echo "OLED wird entfernt..."
    sudo rm -rf /OLED

fi

#--- Systemskripte installieren ---
msg "Installiere Systemskripte..."
Update_Tools.sh

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
disable_if_exists NetworkManager-wait-online.service
#disable_if_exists splashscreen.service
disable_if_exists asplashscreen.service

if [ ! -d /opt/Amiga/data/ ]; then
 info "Install Amiberry!..."
m
fi
#!/usr/bin/env bash
# ============================================================================
# Raspberry Pi 4 – Anti‑Sleep & Performance Boost Script (Debian Trixie)
# ============================================================================
set -euo pipefail

echo "[*] Deaktiviere Energiesparfunktionen und setze maximale Performance..."

# --- CPU Governor auf PERFORMANCE setzen ---
if command -v cpufreq-set >/dev/null; then
    sudo cpufreq-set -g performance
else
    echo "[*] Installiere cpufrequtils..."
    sudo apt update && sudo apt install -y cpufrequtils
    sudo cpufreq-set -g performance
fi

# --- Kernel Governor dauerhaft setzen ---
sudo bash -c 'echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor'
sudo bash -c 'echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor'
sudo bash -c 'echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor'
sudo bash -c 'echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor'

# --- HDMI Sleep verhindern ---
sudo sed -i 's/^#*hdmi_blanking=1/hdmi_blanking=0/' /boot/firmware/config.txt
sudo sed -i 's/^#*display_power_down=1/display_power_down=0/' /boot/firmware/config.txt

# --- WLAN Power Save deaktivieren ---
if command -v iw >/dev/null; then
    sudo iw dev wlan0 set power_save off || true
fi

# dauerhaft:
sudo mkdir -p /etc/NetworkManager/conf.d/
echo -e "[connection]\nwifi.powersave = 2" | sudo tee /etc/NetworkManager/conf.d/wifi-powersave.conf >/dev/null

# --- USB Autosuspend deaktivieren ---
sudo bash -c 'echo -1 > /sys/module/usbcore/parameters/autosuspend'
echo 'options usbcore autosuspend=-1' | sudo tee /etc/modprobe.d/usb-autosuspend.conf >/dev/null

# --- Systemd Sleep komplett deaktivieren ---
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# --- Bildschirm-Timeout deaktivieren (LXDE / XFCE / Wayland) ---
sudo mkdir -p /etc/xdg/lxsession/LXDE-pi/
echo '@xset s off' | sudo tee /etc/xdg/lxsession/LXDE-pi/autostart >/dev/null
echo '@xset -dpms' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart >/dev/null

# --- Wayland / Mutter / KMS ---
sudo mkdir -p /etc/systemd/system/
sudo tee /etc/systemd/system/nosleep.service >/dev/null << 'EOF'
[Unit]
Description=Disable DPMS and Screen Blank

[Service]
Type=oneshot
ExecStart=/usr/bin/xset -dpms
ExecStart=/usr/bin/xset s off

[Install]
WantedBy=graphical.target
EOF

sudo systemctl enable nosleep.service

echo "[✓] Alle Energiesparfunktionen deaktiviert."
echo "[✓] Raspberry Pi 4 läuft jetzt dauerhaft mit maximaler Performance."


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
