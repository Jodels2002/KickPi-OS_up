```bash
#!/bin/bash
#
# Raspberry Pi 4 - Diagnose & vorsichtige Performance-Optimierung
# Geeignet für Raspberry Pi OS / Debian Trixie
#

set -u

CONFIG="/boot/firmware/config.txt"
BACKUP_DIR="/root/rpi-performance-backups"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# ------------------------------------------------------------
# Farben
# ------------------------------------------------------------

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

ok() {
    echo -e "${GREEN}[ OK ]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[FEHLER]${NC} $1"
}

section() {
    echo
    echo "============================================================"
    echo "$1"
    echo "============================================================"
}

# ------------------------------------------------------------
# Root prüfen
# ------------------------------------------------------------

if [ "$EUID" -ne 0 ]; then
    error "Das Skript muss als root ausgeführt werden."
    echo
    echo "Bitte starten mit:"
    echo "  sudo $0"
    exit 1
fi

clear

echo
echo "============================================================"
echo " Raspberry Pi 4 - Diagnose & Performance-Optimierung"
echo "============================================================"
echo

info "Das Skript verändert nur Einstellungen, die als relativ sicher gelten."
info "Vor Änderungen wird ein Backup von config.txt erstellt."
echo

sleep 1

# ------------------------------------------------------------
# Systeminformationen
# ------------------------------------------------------------

section "1. SYSTEMINFORMATIONEN"

echo
echo "Modell:"
cat /proc/device-tree/model 2>/dev/null | tr -d '\0'
echo

echo
echo "Kernel:"
uname -a

echo
echo "Architektur:"
uname -m

echo
echo "Distribution:"
if command -v lsb_release >/dev/null 2>&1; then
    lsb_release -ds
else
    cat /etc/os-release | grep PRETTY_NAME
fi

echo
echo "CPU:"
grep -m1 "model name" /proc/cpuinfo || true

echo
echo "CPU-Kerne:"
nproc

# ------------------------------------------------------------
# Raspberry-Pi-Werkzeuge
# ------------------------------------------------------------

section "2. RASPBERRY-PI-HARDWARE"

if command -v vcgencmd >/dev/null 2>&1; then

    echo
    echo "CPU-Takt aktuell:"
    vcgencmd measure_clock arm

    echo
    echo "GPU/V3D-Takt:"
    vcgencmd measure_clock core 2>/dev/null || true

    echo
    echo "CPU-Spannung:"
    vcgencmd measure_volts core

    echo
    echo "Temperatur:"
    vcgencmd measure_temp

    echo
    echo "Throttling-Status:"
    THROTTLED=$(vcgencmd get_throttled)
    echo "$THROTTLED"

    case "$THROTTLED" in
        *0x0)
            ok "Aktuell kein Throttling erkannt."
            ;;
        *)
            warn "Throttling/Unterspannung wurde erkannt!"
            warn "Das kann die Performance deutlich reduzieren."
            ;;
    esac

else
    warn "vcgencmd ist nicht verfügbar."
    warn "Einige Raspberry-Pi-Hardwareinformationen können nicht abgefragt werden."
fi

# ------------------------------------------------------------
# Speicher
# ------------------------------------------------------------

section "3. SPEICHER"

echo
echo "RAM:"
free -h

echo
echo "Swap:"
swapon --show

# ------------------------------------------------------------
# CPU Governor
# ------------------------------------------------------------

section "4. CPU GOVERNOR"

GOVERNOR_FILE="/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"

if [ -f "$GOVERNOR_FILE" ]; then
    CURRENT_GOVERNOR=$(cat "$GOVERNOR_FILE")

    echo "Aktueller Governor: $CURRENT_GOVERNOR"

    if [ "$CURRENT_GOVERNOR" = "performance" ]; then
        ok "CPU läuft bereits im performance-Modus."
    else
        info "Der aktuelle Governor ist '$CURRENT_GOVERNOR'."
        info "Für normalen Raspberry-Pi-Betrieb ist dies nicht automatisch schlecht."
        info "Der Governor wird NICHT automatisch geändert."
    fi
else
    warn "CPU-Governor konnte nicht ermittelt werden."
fi

# ------------------------------------------------------------
# config.txt
# ------------------------------------------------------------

section "5. CONFIG.TXT"

if [ ! -f "$CONFIG" ]; then
    error "$CONFIG wurde nicht gefunden."
    exit 1
fi

echo
echo "Verwendete Konfiguration:"
echo "$CONFIG"

echo
echo "Relevante Performance-Einstellungen:"

grep -E '^(arm_boost|arm_freq|over_voltage|gpu_freq|v3d_freq|force_turbo|temp_limit)' \
    "$CONFIG" 2>/dev/null || echo "Keine entsprechenden Einstellungen gefunden."

# ------------------------------------------------------------
# Backup
# ------------------------------------------------------------

section "6. BACKUP"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/config.txt.$TIMESTAMP"

info "Erstelle Backup:"
echo "  $BACKUP_FILE"

cp -a "$CONFIG" "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    ok "Backup erfolgreich erstellt."
else
    error "Backup konnte nicht erstellt werden."
    exit 1
fi

# ------------------------------------------------------------
# Raspberry-Pi-4-Erkennung
# ------------------------------------------------------------

section "7. PI-4-ERKENNUNG"

MODEL=$(cat /proc/device-tree/model 2>/dev/null | tr -d '\0')

if echo "$MODEL" | grep -q "Raspberry Pi 4"; then
    ok "Raspberry Pi 4 erkannt."
else
    warn "Das System meldet nicht eindeutig einen Raspberry Pi 4."
    warn "Es werden keine Pi-4-spezifischen Einstellungen vorgenommen."
    exit 0
fi

# ------------------------------------------------------------
# ARM BOOST
# ------------------------------------------------------------

section "8. ARM BOOST"

if grep -Eq '^[[:space:]]*arm_boost=' "$CONFIG"; then

    CURRENT_BOOST=$(grep -E '^[[:space:]]*arm_boost=' "$CONFIG" | tail -1)

    echo "Vorhandene Einstellung:"
    echo "  $CURRENT_BOOST"

    if echo "$CURRENT_BOOST" | grep -q "arm_boost=1"; then
        ok "arm_boost=1 ist bereits aktiviert."
    else
        warn "arm_boost ist vorhanden, aber nicht auf 1 gesetzt."
        info "Es wird keine Änderung vorgenommen."
        info "Die vorhandene Einstellung bleibt erhalten."
    fi

else

    info "arm_boost ist noch nicht in config.txt eingetragen."
    info "Versuche eine sichere Aktivierung."

    # Nur bei späteren Pi-4-Revisionen.
    # Rev 1.5 und neuer unterstützen die entsprechende
    # zweiphasige Stromversorgung.

    REVISION=$(tr -d '\0' < /proc/device-tree/system/linux,revision 2>/dev/null || true)

    # Modelltext enthält bei neueren Boards meistens die Revision.
    MODEL_REV=$(echo "$MODEL" | grep -oE 'Rev [0-9]+\.[0-9]+' | head -1 || true)

    echo
    echo "Board:"
    echo "$MODEL"

    if echo "$MODEL_REV" | grep -qE 'Rev 1\.[5-9]'; then

        info "Spätere Pi-4-Revision erkannt: $MODEL_REV"
        info "Aktiviere arm_boost=1."
        info "Damit kann der Pi 4 den höheren Standard-Turbotakt verwenden."

        echo "arm_boost=1" >> "$CONFIG"

        if grep -q "^arm_boost=1$" "$CONFIG"; then
            ok "arm_boost=1 wurde aktiviert."
        else
            error "Aktivierung konnte nicht überprüft werden."
        fi

    else

        warn "Keine eindeutig unterstützte spätere Pi-4-Revision erkannt."
        warn "arm_boost wird NICHT automatisch aktiviert."
        warn "Damit wird ein unnötiges Risiko vermieden."

    fi
fi

# ------------------------------------------------------------
# Gefährliche Overclocking-Einstellungen prüfen
# ------------------------------------------------------------

section "9. ÜBERTAKTUNG PRÜFEN"

if grep -Eq '^[[:space:]]*(over_voltage|force_turbo|arm_freq)=' "$CONFIG"; then

    warn "Manuelle Overclocking-Einstellungen wurden gefunden:"
    grep -E '^[[:space:]]*(over_voltage|force_turbo|arm_freq)=' "$CONFIG"

    echo
    warn "Diese Einstellungen werden NICHT automatisch verändert."

else

    ok "Keine aggressive manuelle CPU-Übertaktung gefunden."
fi

# ------------------------------------------------------------
# GPU prüfen
# ------------------------------------------------------------

section "10. GPU/V3D"

if grep -Eq '^[[:space:]]*(gpu_freq|v3d_freq)=' "$CONFIG"; then

    warn "Manuelle GPU-Takt-Einstellung gefunden:"
    grep -E '^[[:space:]]*(gpu_freq|v3d_freq)=' "$CONFIG"

    warn "Diese Einstellung wird nicht automatisch verändert."

else
    ok "Keine manuelle GPU-Übertaktung gefunden."
fi

# ------------------------------------------------------------
# Dienste / unnötige Belastung
# ------------------------------------------------------------

section "11. SYSTEMBELASTUNG"

info "Prüfe laufende Dienste mit hoher Relevanz für Performance."

echo
echo "Top-Prozesse nach CPU-Verbrauch:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -11

echo
echo "Top-Prozesse nach RAM-Verbrauch:"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -11

info "Es werden keine Dienste automatisch deaktiviert."
info "Das hängt stark davon ab, wofür der Raspberry Pi verwendet wird."

# ------------------------------------------------------------
# Datenträger
# ------------------------------------------------------------

section "12. DATENTRÄGER"

echo
df -h /

echo
info "I/O-Informationen:"
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS 2>/dev/null || true

# ------------------------------------------------------------
# Temperatur nach Änderung
# ------------------------------------------------------------

section "13. ABSCHLUSSCHECK"

if command -v vcgencmd >/dev/null 2>&1; then

    echo
    echo "Temperatur:"
    vcgencmd measure_temp

    echo
    echo "CPU-Takt:"
    vcgencmd measure_clock arm

    echo
    echo "Throttling:"
    vcgencmd get_throttled

fi

# ------------------------------------------------------------
# Zusammenfassung
# ------------------------------------------------------------

section "14. ZUSAMMENFASSUNG"

echo
ok "Diagnose abgeschlossen."

echo
echo "Backup:"
echo "  $BACKUP_FILE"

echo
echo "Konfiguration:"
echo "  $CONFIG"

echo
echo "WICHTIG:"
echo "  Änderungen an config.txt werden erst nach einem Neustart aktiv."

echo
if grep -q "^arm_boost=1$" "$CONFIG"; then
    ok "arm_boost=1 ist in config.txt aktiviert."
    warn "Nach dem Neustart Temperatur und Throttling kontrollieren."
else
    info "Keine automatische CPU-Übertaktung aktiviert."
fi

echo
echo "Empfohlener nächster Schritt:"
echo
echo "  sudo reboot"
echo
echo "Danach prüfen mit:"
echo
echo "  vcgencmd measure_temp"
echo "  vcgencmd measure_clock arm"
echo "  vcgencmd get_throttled"
echo

echo "============================================================"
echo " Fertig"
echo "============================================================"
```
