sudo apt update
sudo apt install python3 python3-pip git -y

# Ollama installieren
curl -fsSL https://ollama.com/install.sh | sh

# kleines Modell (läuft gut auf Pi 5)
ollama pull phi3
