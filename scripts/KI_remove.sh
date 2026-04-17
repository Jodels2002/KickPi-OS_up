#!/usr/bin/env bash



echo "⚠️  Dieses Script entfernt die lokale AI Installation vollständig!"
read -p "Fortfahren? (y/N): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Abgebrochen."
    exit 0
fi

echo "🧠 Stoppe Ollama Dienst (falls aktiv)..."
sudo systemctl stop ollama 2>/dev/null || true
sudo systemctl disable ollama 2>/dev/null || true

echo "🗑️ Entferne Ollama..."
sudo rm -rf /usr/local/bin/ollama
sudo rm -rf /usr/lib/ollama
sudo rm -rf ~/.ollama

echo "🧹 Entferne AI CLI Tool..."
sudo rm -f /usr/local/bin/ai


echo "⚙️ Systemoptimierungen zurücksetzen..."

# Swap zurücksetzen
if [ -f /etc/dphys-swapfile ]; then
    echo "🔄 Setze Swap zurück..."
    sudo dphys-swapfile swapoff || true
    sudo sed -i 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=100/' /etc/dphys-swapfile
    sudo dphys-swapfile setup
    sudo dphys-swapfile swapon
fi

# GPU Memory entfernen
if grep -q "gpu_mem=64" /boot/firmware/config.txt; then
    echo "🎮 Entferne GPU Memory Anpassung..."
    sudo sed -i '/gpu_mem=64/d' /boot/firmware/config.txt
fi

# CPU Governor zurücksetzen
if [ -f /etc/default/cpufrequtils ]; then
    echo "⚡ Setze CPU Governor zurück..."
    sudo rm -f /etc/default/cpufrequtils
fi

echo "🧼 Cache bereinigen..."
sudo apt clean

echo "✅ Deinstallation abgeschlossen!"
echo ""
echo "👉 Ein Neustart wird empfohlen:"
echo "sudo reboot"
