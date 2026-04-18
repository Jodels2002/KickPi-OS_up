#!/bin/bash

# === Konfiguration ===
SRC_DIRS=("/opt" "/home/pi")
MOUNT_POINT="/media/pi/500GB-USB"
DEVICE="/dev/sda1"
BACKUP_DIR="$MOUNT_POINT/Backup"
LOG_FILE="/var/log/backup_script.log"

# === Funktionen ===
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# === Start ===
log_message "Starte Backup-Prozess."

# === Mount prüfen & sicherstellen ===
if ! mountpoint -q "$MOUNT_POINT"; then
    log_message "USB-Stick nicht gemountet. Versuche Mount..."
    sudo mkdir -p "$MOUNT_POINT"
    if sudo mount "$DEVICE" "$MOUNT_POINT"; then
        log_message "Erfolgreich gemountet."
    else
        log_message "FEHLER: Konnte $DEVICE nicht mounten."
        exit 1
    fi
fi

# === Backup mit Fortschrittsanzeige ===
for SRC in "${SRC_DIRS[@]}"; do
    if [ ! -d "$SRC" ]; then
        log_message "WARNUNG: Quellverzeichnis $SRC existiert nicht. Überspringe..."
        continue
    fi

    # Ziel-Unterordner für die jeweilige Quelle erstellen
    TARGET="$BACKUP_DIR$SRC"
    mkdir -p "$TARGET"

    log_message "Sichere $SRC nach $TARGET ..."

    # rsync flags: 
    # -a: Archiv-Modus (erhält Rechte, Zeitstempel, etc.)
    # -v: Verbose (zeigt Dateien an)
    # --delete: Löscht Dateien im Backup, die im Quell-Ordner nicht mehr existieren
    # --info=progress2: Zeigt den Fortschritt der gesamten Übertragung statt jeder Datei
    # --stats: Gibt eine Zusammenfassung am Ende aus
    rsync -av --delete --info=progress2 --stats "$SRC/" "$TARGET" >> "$LOG_FILE" 2>&1

    if [ $? -eq 0 ]; then
        log_message "Backup von $SRC erfolgreich beendet."
    else
        log_message "FEHLER: Backup von $SRC fehlgeschlagen."
    fi
done

log_message "Backup-Prozess abgeschlossen."
