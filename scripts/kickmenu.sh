#!/bin/bash


# ==================================================
# KickPi-OS 
# ==================================================

# ---------- Colors ----------
RESET='\033[0m'
BOLD='\033[1m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'

# ---------- Paths ----------
INSTALL_DIR="$HOME/Amiga"
BACKUP_DIR="/opt/Backup"
SRC_DIR="$HOME/amiberry"

# ---------- UI Functions ----------
  sudo apt install -y build-essential git cmake libsdl3-dev libsdl3-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev libportmidi-dev libenet-dev libpcap-dev libzstd-dev libcurl4-openssl-dev nlohmann-json3-dev libdbus-1-dev
  sudo apt install -y libsdl2-ttf-2.0-0 libsdl2-ttf-dev
header() {
    clear
    echo -e "${MAGENTA}"
    toilet -f future "KickPi-OS"
    echo -e "${CYAN}═══════════════════════════════════════════════${RESET}"
    echo -e "${BOLD} KickPi-OS ROM Operating System v4.0${RESET}"
    echo -e "${CYAN}═══════════════════════════════════════════════${RESET}"
    echo ""
}

success() { echo -e "${GREEN}✔ $1${RESET}"; }
info()    { echo -e "${BLUE}➜ $1${RESET}"; }
warn()    { echo -e "${YELLOW}⚠ $1${RESET}"; }
error()   { echo -e "${RED}✖ $1${RESET}"; }

pause() {
    echo ""
    read -p "Press ENTER to continue..."
}

# ---------- Amiberry Update ----------
update_amiberry() {

# ============================================================
# Einstellungen
# ============================================================

SRC_DIR="$HOME/amiberry"
INSTALL_DIR="/opt/amiberry"
BACKUP_DIR="$HOME/amiberry_backup"


# ============================================================
# Alten Quellcode löschen
# ============================================================

echo "=== Alten Amiberry-Quellcode löschen ==="
rm -rf "$SRC_DIR"

# ============================================================
# Amiberry herunterladen
# ============================================================

echo "=== Amiberry aus GitHub herunterladen ==="
git clone https://github.com/midwan/amiberry.git "$SRC_DIR"
cd "$SRC_DIR"

# ============================================================
# Kompilieren
# ============================================================

echo
echo "=== CMake konfigurieren ==="

cmake -B "$SRC_DIR/build" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_FLAGS="-O2 -fno-tree-vectorize -DNO_NEON" \
  -DCMAKE_CXX_FLAGS="-O2 -fno-tree-vectorize -DNO_NEON"


echo
echo "======================================"
echo " Amiberry wird kompiliert"
echo "======================================"
echo

cmake --build "$SRC_DIR/build" -j4

# ============================================================
# Build prüfen
# ============================================================

if [ ! -f "$SRC_DIR/build/amiberry" ]; then
    echo
    echo "❌ BUILD FEHLGESCHLAGEN!"
    echo
    echo "Keine Amiberry-Binary gefunden:"
    echo "$SRC_DIR/build/amiberry"
    echo
    read -p "ENTER drücken zum Beenden..."
    exit 1
fi

echo
echo "✔ Build erfolgreich!"
echo

# ============================================================
# Installationsverzeichnisse
# ============================================================

echo "=== Installationsverzeichnisse vorbereiten ==="
sudo mkdir -p "$INSTALL_DIR"
mkdir -p "$BACKUP_DIR"

# ============================================================
# Alte Version sichern
# ============================================================

if [ -f "$INSTALL_DIR/amiberry" ]; then
    TS="$(date +%Y%m%d_%H%M%S)"

    echo "=== Alte Amiberry-Version sichern ==="

    sudo cp "$INSTALL_DIR/amiberry" "$BACKUP_DIR/amiberry_$TS"
    sudo cp "$INSTALL_DIR/amiberry" "$INSTALL_DIR/amiberry_old"

    echo "✔ Backup erstellt:"
    echo "$BACKUP_DIR/amiberry_$TS"
fi

# ============================================================
# Neue Binary installieren
# ============================================================

echo
echo "=== Neue Amiberry-Version installieren ==="

sudo cp "$SRC_DIR/build/amiberry" "$INSTALL_DIR/amiberry"
sudo chmod +x "$INSTALL_DIR/amiberry"

# ============================================================
# Daten installieren
# ============================================================

echo "=== Amiberry-Daten installieren ==="

sudo cp -r \
    "$SRC_DIR/data" \
    "$SRC_DIR/external" \
    "$SRC_DIR/whdboot" \
    "$INSTALL_DIR/"

# ============================================================
# Home-Verknüpfung
# ============================================================

ln -sfn "$INSTALL_DIR" "$HOME/Amiberry"

# ============================================================
# Version anzeigen
# ============================================================

echo
echo "======================================"
echo " Installation erfolgreich!"
echo "======================================"
echo

echo "Amiberry:"
echo "$INSTALL_DIR/amiberry"

echo
echo "Verknüpfung:"
echo "$HOME/Amiberry"

echo
echo "Backup:"
echo "$BACKUP_DIR"

echo
echo "✔ Amiberry wurde erfolgreich aktualisiert!"
echo

read -p "ENTER drücken zum Beenden..."

}

# ---------- Amiberry DEV ----------
update_amiberry_dev() {

     
Update_Amiberry.sh

    info "Updating Amiberry DEV..."
    
    rm -rf "$HOME/amiberry-lite"

    git clone https://github.com/BlitterStudio/amiberry-lite "$HOME/amiberry-lite"
    cd "$HOME/amiberry-lite"

    cmake -B build && cmake --build build -j4

    sudo cp build/amiberry-lite "$HOME/Amiga/amiberry_dev"
    sudo cp -r data "$HOME/Amiga"
    sudo cp -r external "$HOME/Amiga"
    sudo cp -r whdboot "$HOME/Amiga"
    rm -rf "$HOME/amiberry-lite"
    rm -rf "$HOME/Amiberry-lite"
    sudo ln -s /opt/Amiga/ /home/$USER/Amiberry-Lite
    boot.sh
    success "Amiberry DEV updated!"
    pause
}

# ---------- Main Menu ----------
header

OPTIONS=$(dialog --clear \
--backtitle "KickPi-OS Control Center" \
--title "Main Menu" \
--menu "Select an option:" \
20 60 10 \
1 "Boot KickPi Desktop" \
2 "Boot Amiga (Amiberry)" \
3 "Boot CLI" \
4 "Update Amiberry" \
5 "Update Amiberry DEV" \
6 "Install AmigaVision 2026" \
7 "Raspi-Config" \
8 "Shutdown" \
3>&1 1>&2 2>&3)

clear

case $OPTIONS in

1)
    header
    info "Switching to Desktop..."
    sudo raspi-config nonint do_boot_behaviour B4
    success "Desktop mode enabled."
    pause
;;

2)
    header
    info "Switching to Amiga mode..."
    sudo raspi-config nonint do_boot_behaviour B2
    success "System will boot into Amiberry."
    sleep 3
    sudo reboot
;;

3)
    header
    info "Switching to CLI..."
    sudo raspi-config nonint do_boot_behaviour B2
    success "CLI mode enabled."
    pause
;;

4)
    header
    
    update_amiberry
;;

5)
    header
  
    update_amiberry_dev
;;

6)
    header
    Update_Amiberry.sh
    vision
;;

7)
    sudo raspi-config
;;

8)
    header
    warn "System shutting down..."
    sleep 2
    sudo shutdown now
;;

*)
    header
    error "No valid option selected."
;;

esac

header
success "KickPi-OS ready."
