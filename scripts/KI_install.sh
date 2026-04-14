#!/usr/bin/env bash

# Fehler abfangen
set -e

echo "🚀 Starte High-Performance AI Setup für Raspberry Pi 5..."

# 1. System-Update & Abhängigkeiten
echo "📦 Update System & installiere Tools..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git build-essential htop python3 python3-pip zram-tools

# 2. Ollama Installation
if ! command -v ollama &> /dev/null; then
    echo "🧠 Installiere Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "✅ Ollama bereits installiert."
fi

# 3. RAM Check & Modell-Strategie
TOTAL_RAM=$(free -m | awk '/^Mem:/{print $2}')

# Empfehlung: Llama3 ist ein besserer Allrounder für Systembefehle
if [ "$TOTAL_RAM" -ge 7000 ]; then
    MODEL="llama3:8b" # Kraftpaket für den 8GB Pi
    echo "💪 8GB RAM erkannt -> Nutze Llama3 (8B)"
else
    MODEL="phi3:mini" # Extrem schnell auf dem 4GB Pi
    echo "⚠️ 4GB RAM erkannt -> Nutze Phi-3 Mini"
fi

echo "📥 Lade Modell $MODEL..."
ollama pull $MODEL

# 4. Das 'AI' CLI Tool mit System-Kontext erstellen
echo "⚙️ Erstelle smartes CLI-Tool..."

sudo tee /usr/local/bin/ai > /dev/null << 'EOF'
#!/usr/bin/env bash
MODEL="REPLACE_MODEL"
# Der System-Prompt sagt der KI, wer sie ist
SYSTEM_PROMPT="Du bist ein Experte für Raspberry Pi 5, Debian Linux und Retro-Emulation (Amiberry, RetroPie). Antworte kurz und präzise. Wenn du Scripte erstellst, achte auf Performance."

if [ -z "$1" ]; then
    echo "Usage: ai 'Deine Frage oder Aufgabe'"
    exit 1
fi

# Übergabe an Ollama mit System-Instruktion
ollama run $MODEL "System: $SYSTEM_PROMPT User: $*"
EOF

# Modellnamen im erstellten Script dynamisch anpassen
sudo sed -i "s/REPLACE_MODEL/$MODEL/" /usr/local/bin/ai
sudo chmod +x /usr/local/bin/ai

# 5. Pi 5 Optimierungen für Emulation & AI
echo "🛠️ Optimiere System für Amiberry & AI..."

# ZRAM aktivieren (komprimierter RAM ist schneller als SD-Karten-Swap)
echo "enabling ZRAM..."
sudo bash -c 'echo "ALGO=lz4" >> /etc/default/zramswap'
sudo bash -c 'echo "PERCENT=50" >> /etc/default/zramswap'
sudo systemctl restart zramswap

# GPU / RAM Split
# Beim Pi 5 wird gpu_mem weniger wichtig, da Wayland/KMS dynamisch verwaltet.
# Aber für Amiberry sind 128MB oft ein guter Wert.
if ! grep -q "gpu_mem" /boot/firmware/config.txt; then
    echo "gpu_mem=128" | sudo tee -a /boot/firmware/config.txt
fi

# Overclocking-Vorbereitung (optional, nur Hinweis)
echo "💡 Tipp: Für maximale AI-Speed könntest du in /boot/firmware/config.txt"
echo "   arm_freq=2800 ergänzen (gute Kühlung vorausgesetzt!)"

echo ""
echo "✅ Fertig! Dein Pi 5 ist jetzt ein kleiner KI-Server."
echo "👉 Probiere: ai 'Schreibe ein Backup-Script für meine Amiberry ROMs'"
