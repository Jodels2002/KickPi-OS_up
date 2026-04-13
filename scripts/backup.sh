#!/bin/bash

# === Konfiguration ===
SRC_DIRS=("/opt" "/home/pi")
MOUNT_POINT="/media/pi/500GB-USB"
DEVICE="/dev/sda1"
BACKUP_DIR="$MOUNT_POINT/Backup"

# === Mount prüfen ===
if ! mount | grep -q "$MOUNT_POINT"; then
    echo "USB-Stick wird gemountet..."
    sudo mkdir -p "$MOUNT_POINT"
    sudo mount "$DEVICE" "$MOUNT_POINT"

    if [ $? -ne 0 ]; then
        echo "Fehler beim Mounten von $DEVICE"
        exit 1
    fi
fi

# === Backup-Ordner erstellen ===
mkdir -p "$BACKUP_DIR"

# === Backup starten ===
for SRC in "${SRC_DIRS[@]}"; do
    echo "Sichere $SRC nach $BACKUP_DIR..."

    rsync -av --delete \
        --update \
        "$SRC/" "$BACKUP_DIR$(echo $SRC)"

done

echo "Backup abgeschlossen."
