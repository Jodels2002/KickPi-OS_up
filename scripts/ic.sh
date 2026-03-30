#!/usr/bin/env bash


########################################
# CONFIG
########################################
AMIGA_DIR="$HOME/Amiga"
INSTALL_DIR="$AMIGA_DIR/Install"
WORK_DIR="$AMIGA_DIR/dir/Work"
KICKSTART="$AMIGA_DIR/kickstarts/kick31a1200.rom"

export PATH="$HOME/.local/bin:$PATH"

########################################
# COLORS
########################################
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREY='\033[1;30m'
NC='\033[0m'

########################################
# LOGGING
########################################
log() { echo -e "${GREEN}[+]${NC} $*"; }
warn() { echo -e "${RED}[!]${NC} $*"; }

########################################
# REQUIREMENTS
########################################
install_deps() {
    log "Installing dependencies..."
    sudo apt update
    sudo apt install -y \
        unzip wget rsync toilet whiptail \
        python3-pip python3-venv x11-xserver-utils
}

install_python_tools() {
    if ! command -v gdown &>/dev/null; then
        log "Installing gdown..."
        python3 -m pip install --user gdown
    fi

    if ! command -v xdftool &>/dev/null; then
        log "Installing amitools..."
        python3 -m pip install --user amitools
    fi
}

########################################
# CHECK DESKTOP
########################################
check_desktop() {
    if [[ -z "${DISPLAY:-}" ]]; then
        warn "Run this script in a Desktop session!"
        exit 1
    fi
}

########################################
# PREPARE DIRS
########################################
prepare_dirs() {
    mkdir -p "$INSTALL_DIR/WHDLoad/Games"
    mkdir -p "$INSTALL_DIR/WHDLoad/Demos"
    mkdir -p "$WORK_DIR"
    mkdir -p "$AMIGA_DIR/kickstarts"
}

########################################
# DOWNLOAD WHDLOAD
########################################
download_whdload() {
    log "Downloading WHDLoad packages..."

    cd "$INSTALL_DIR/WHDLoad/Games"

    declare -A files=(
        ["OCS.zip"]="12mNx9uZjiGY47mGN5It7oFjgttS7tZvm"
        ["AGA.zip"]="12oG6cmivWTtz_ZgcWHgxcBdRWo4J3d55"
        ["CDTV.zip"]="12TU8U8L_3pe5Fg6A-u9PXLX1InbiCxBH"
    )

    for file in "${!files[@]}"; do
        [[ -f "$file" ]] || gdown --id "${files[$file]}"
    done

    cd "$INSTALL_DIR/WHDLoad/Demos"
    [[ -f AGA.zip ]] || gdown --id 12ycTm7EGRkLouuRMW896azGfKku3l1V3
}

########################################
# EXTRACT WHDLOAD
########################################
extract_whdload() {
    log "Extracting WHDLoad..."

    mkdir -p "$WORK_DIR/WHDLoad_Games"
    mkdir -p "$WORK_DIR/WHDLoad_Demos"

    unzip -o "$INSTALL_DIR/WHDLoad/Games/"*.zip -d "$WORK_DIR/WHDLoad_Games"
    unzip -o "$INSTALL_DIR/WHDLoad/Demos/"*.zip -d "$WORK_DIR/WHDLoad_Demos"
}

########################################
# CLASSICWB DOWNLOAD
########################################
download_classicwb() {
    cd "$INSTALL_DIR"
    log "Downloading ClassicWB..."

    files=(
        "ClassicWB_UAE_v28.zip"
        "ClassicWB_68K_v28.zip"
        "ClassicWB_LITE_v28.zip"
    )

    for f in "${files[@]}"; do
        if [[ ! -f "$f" ]]; then
            wget "http://download.abime.net/classicwb/$f"
            unzip -o -q "$f"
        fi
    done
}

########################################
# DF0 SETUP
########################################
setup_df0() {
    log "Setting up DF0..."

    mkdir -p "$INSTALL_DIR/DF0"

    unzip -o -q /opt/KickPi-OS/Amiga/ClassicWB/DF0.zip
    cp -r /opt/KickPi-OS/Amiga/ClassicWB/DF0/* "$INSTALL_DIR/DF0"
}

########################################
# CLASSICWB SETUP (BASIC)
########################################
setup_classicwb() {
    log "Setting up ClassicWB..."

    mkdir -p "$AMIGA_DIR/dir/Software"

    cp -r "$INSTALL_DIR/ClassicWB_UAE_v28/Hard Disk/Software/" \
          "$AMIGA_DIR/dir/"

    ln -sf "$WORK_DIR/WHDLoad_Games" \
        "$AMIGA_DIR/dir/Software/Games"

    ln -sf "$WORK_DIR/WHDLoad_Demos" \
        "$AMIGA_DIR/dir/Software/Demos"
}

########################################
# KICKSTART CHECK
########################################
check_kickstart() {
    if [[ ! -f "$KICKSTART" ]]; then
        warn "Kickstart ROM missing!"
        whiptail --msgbox "Please copy your legal Kickstart ROM to:
$KICKSTART" 10 60
        exit 1
    fi
}

########################################
# MAIN
########################################
main() {
    clear
    toilet "KickPi-OS" --metal

    install_deps
    install_python_tools
    check_desktop
    prepare_dirs
    check_kickstart

    download_whdload
    extract_whdload
    download_classicwb
    setup_df0
    setup_classicwb

    log "Done! ClassicWB ready 🎉"
}

main
