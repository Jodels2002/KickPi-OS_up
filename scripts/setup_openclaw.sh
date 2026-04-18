#!/bin/bash

# Prüfen auf Root-Rechte
if [ "$EUID" -ne 0 ]; then echo "Bitte als Root ausführen (sudo)"; exit; fi

echo "--- Starte System-Optimierung für Raspberry Pi 5 ---"

# 1. System aktualisieren
apt update && apt upgrade -y

# 2. Swap-File für Stabilität (wichtig bei KI-Anwendungen)
if [ ! -f /swapfile ]; then
    fallocate -l 2G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    echo '/swapfile none swap sw 0 0' >> /etc/fstab
fi

# 3. Optimierungen für Langlebigkeit und Leistung
# Swappiness reduzieren
sysctl -w vm.swappiness=10
echo 'vm.swappiness=10' >> /etc/sysctl.conf

# 4. Installation notwendiger Basis-Tools
apt install -y git curl build-essential unattended-upgrades

# 5. Automatisierte Administration einrichten
# Sicherheits-Updates automatisch installieren
dpkg-reconfigure -f noninteractive unattended-upgrades

# Cron-Job für wöchentliche Bereinigung erstellen
(crontab -l 2>/dev/null; echo "0 3 * * 0 apt autoremove -y && apt clean") | crontab -

echo "--- Installation von OpenClaw ---"
# Offizielles OpenClaw Installationsskript
curl -fsSL https://openclaw.ai/install.sh | bash

echo "--- Setup abgeschlossen ---"
echo "Bitte starte jetzt den Onboarding-Prozess mit: openclaw onboard --install-daemon"
