#!/usr/bin/env bash



echo "Installiere Amiberry MCP Server (angepasst auf /opt/Amiga)..."

# Variablen
INSTALL_DIR="$HOME/ai-mcp"
AMIBERRY_BIN="/opt/Amiga/amiberry/amiberry"
USER_NAME="$(whoami)"

# Prüfen ob Amiberry existiert
if [ ! -f "$AMIBERRY_BIN" ]; then
    echo "Amiberry wurde nicht unter $AMIBERRY_BIN gefunden!"
    exit 1
fi

echo "Amiberry gefunden: $AMIBERRY_BIN"

echo "Installiere Abhängigkeiten..."
sudo apt update
sudo apt install -y python3 python3-pip curl

pip3 install --user flask

echo "Erstelle MCP Verzeichnis..."
mkdir -p "$INSTALL_DIR"

echo "Erstelle MCP Server..."

cat > "$INSTALL_DIR/server.py" << EOF
from flask import Flask, request, jsonify
import subprocess
import os

app = Flask(__name__)

AMIBERRY_BIN = "$AMIBERRY_BIN"

@app.route("/start_amiberry", methods=["POST"])
def start_amiberry():
    config = request.json.get("config", "")
    
    if not os.path.exists(AMIBERRY_BIN):
        return jsonify({"error": "Amiberry binary not found"}), 500

    try:
        cmd = [AMIBERRY_BIN]
        
        if config:
            cmd += ["-f", config]

        subprocess.Popen(cmd)
        return jsonify({"status": "started", "cmd": cmd})
    except Exception as e:
        return jsonify({"error": str(e)})

@app.route("/stop_amiberry", methods=["POST"])
def stop_amiberry():
    subprocess.call(["pkill", "-f", AMIBERRY_BIN])
    return jsonify({"status": "stopped"})

@app.route("/status", methods=["GET"])
def status():
    result = subprocess.getoutput(f"pgrep -f {AMIBERRY_BIN}")
    return jsonify({"running": bool(result)})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

echo "⚙️ Erstelle Systemd Service..."

sudo tee /etc/systemd/system/amiberry-mcp.service > /dev/null << EOF
[Unit]
Description=Amiberry MCP Server
After=network.target

[Service]
ExecStart=/usr/bin/python3 $INSTALL_DIR/server.py
Restart=always
User=$USER_NAME
WorkingDirectory=$HOME

[Install]
WantedBy=multi-user.target
EOF

echo "Aktiviere Service..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable amiberry-mcp
sudo systemctl restart amiberry-mcp

echo "Erstelle CLI Tool..."

sudo tee /usr/local/bin/ai-amiga > /dev/null << 'EOF'
#!/usr/bin/env bash

CMD="$1"
CONFIG="$2"

case "$CMD" in
    start)
        curl -s -X POST http://localhost:5000/start_amiberry \
        -H "Content-Type: application/json" \
        -d "{\"config\":\"$CONFIG\"}"
        ;;
    stop)
        curl -s -X POST http://localhost:5000/stop_amiberry
        ;;
    status)
        curl -s http://localhost:5000/status
        ;;
    *)
        echo "Usage: ai-amiga {start|stop|status} [config.uae]"
        ;;
esac
EOF

sudo chmod +x /usr/local/bin/ai-amiga

echo "🧪 Teste Service..."
sleep 2
curl -s http://localhost:5000/status || true

echo ""
echo "Installation abgeschlossen!"
echo ""
echo " Nutzung:"
echo "ai-amiga start"
echo "ai-amiga start config.uae"
echo "ai-amiga status"
echo "ai-amiga stop"
