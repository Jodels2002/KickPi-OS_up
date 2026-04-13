#!/bin/bash



echo "=== System Update ==="
sudo apt update && sudo apt upgrade -y

echo "=== Abhängigkeiten installieren ==="
sudo apt install -y curl git python3 python3-pip docker.io

echo "=== Docker aktivieren ==="
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

echo "=== Ollama installieren ==="
curl -fsSL https://ollama.com/install.sh | sh

sleep 5

echo "=== Ollama starten ==="
sudo systemctl enable ollama
sudo systemctl start ollama

echo "=== Modell laden (leicht für Pi) ==="
ollama pull deepseek-coder:1.3b

echo "=== Open WebUI installieren ==="
docker run -d \
  -p 3000:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v open-webui:/app/backend/data \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main

echo ""
echo "=== Fertig ==="
echo "Webinterface: http://<RASPI-IP>:3000"
echo "Modell: deepseek-coder:1.3b"
