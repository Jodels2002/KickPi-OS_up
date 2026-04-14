#!/usr/bin/env bash




echo "🔧 System wird vorbereitet..."
sudo apt update && sudo apt upgrade -y

echo "📦 Basis-Pakete installieren..."
sudo apt install -y curl git build-essential htop neovim python3 python3-pip

echo "🧠 Ollama installieren..."
curl -fsSL https://ollama.com/install.sh | sh

echo "⏳ Warte auf Ollama Start..."
sleep 5

echo "🔍 Prüfe verfügbaren RAM..."
TOTAL_RAM=$(free -m | awk '/^Mem:/{print $2}')

MODEL="deepseek-coder:1.3b"

if [ "$TOTAL_RAM" -ge 7000 ]; then
    echo "💪 Genug RAM erkannt → nutze stärkeres Modell"
    MODEL="deepseek-coder:6.7b"
else
    echo "⚠️ Weniger RAM → nutze leichtgewichtiges Modell"
fi

echo "📥 Lade Modell: $MODEL"
ollama pull $MODEL

echo "⚙️ CLI Tool erstellen..."

sudo tee /usr/local/bin/ai > /dev/null << EOF
#!/usr/bin/env bash

MODEL="$MODEL"
PROMPT="\$*"

if [ -z "\$PROMPT" ]; then
    echo "Usage: ai \"deine frage\""
    exit 1
fi

ollama run \$MODEL "\$PROMPT"
EOF

sudo chmod +x /usr/local/bin/ai

echo "🛠️ Systemoptimierungen für Raspberry Pi..."

# GPU Speicher reduzieren (mehr RAM für AI)
if ! grep -q "gpu_mem" /boot/firmware/config.txt; then
    echo "gpu_mem=64" | sudo tee -a /boot/firmware/config.txt
fi

# Swap erhöhen (wichtig für LLMs)
sudo dphys-swapfile swapoff
sudo sed -i 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=2048/' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

echo "⚡ CPU Governor auf Performance setzen..."
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl disable ondemand || true

echo ""
echo "✅ Installation abgeschlossen!"
echo ""
echo "🧠 Verwendetes Modell: $MODEL"
echo ""
echo "👉 Teste mit:"
echo "ai \"Erkläre mir apt Optimierung\""
