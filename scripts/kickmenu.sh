#!/bin/bash
set -e

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
INSTALL_DIR="/opt/Amiga"
BACKUP_DIR="/opt/Backup"

# ---------- UI Functions ----------

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

    info "Updating Amiberry..."
    sudo apt update
    sudo apt install -y build-essential git cmake \
        libsdl2-dev libsdl2-image-dev libflac-dev libmpg123-dev \
        libpng-dev libmpeg2-4-dev libserialport-dev \
        libportmidi-dev libenet-dev libpcap-dev libzstd-dev

    rm -rf "$HOME/amiberry"
    git clone https://github.com/midwan/amiberry "$HOME/amiberry"

    cd "$HOME/amiberry"
    cmake -B build
    cmake --build build -j$(nproc)

    sudo mkdir -p "$BACKUP_DIR"

    if [ -f "$INSTALL_DIR/amiberry" ]; then
        sudo cp "$INSTALL_DIR/amiberry" \
        "$BACKUP_DIR/amiberry_$(date +%Y%m%d_%H%M%S)"
    fi

    sudo cp build/amiberry "$INSTALL_DIR/amiberry"

    success "Amiberry updated successfully!"
    pause
}

# ---------- Amiberry DEV ----------
update_amiberry_dev() {

    info "Updating Amiberry DEV..."
    rm -rf "$HOME/amiberry-lite"

    git clone https://github.com/BlitterStudio/amiberry-lite "$HOME/amiberry-lite"
    cd "$HOME/amiberry-lite"

    cmake -B build
    cmake --build build -j$(nproc)

    sudo cp build/amiberry "$INSTALL_DIR/amiberry_dev"

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
6 "Install Cool-Retro-Term" \
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
    info "Installing Cool-Retro-Term..."
    sudo apt install -y qmlscene qt5-qmake qtdeclarative5-dev \
        qml-module-qtquick-controls2 qtquickcontrols2-5-dev
    git clone --recursive https://github.com/Swordfish90/cool-retro-term.git
    cd cool-retro-term
    qmake && make
    ./cool-retro-term
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
