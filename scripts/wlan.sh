#!/bin/bash

echo "Scanne nach WLAN-Netzwerken..."
sleep 2

# WLANs scannen und SSIDs extrahieren
mapfile -t networks < <(nmcli -t -f SSID dev wifi list | grep -v '^$' | sort -u)

if [ ${#networks[@]} -eq 0 ]; then
   echo "Keine Netzwerke gefunden."
   exit 1
fi

echo "Gefundene Netzwerke:"
for i in "${!networks[@]}"; do
   echo "$i) ${networks[$i]}"
done

# Auswahl
read -p "Wähle ein Netzwerk (Nummer): " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -ge "${#networks[@]}" ]; then
   echo "Ungültige Auswahl."
   exit 1
fi

SSID="${networks[$choice]}"

# Passwort abfragen
read -s -p "Passwort für $SSID: " password
echo ""

echo "Verbinde mit $SSID..."

nmcli dev wifi connect "$SSID" password "$password"

if [ $? -eq 0 ]; then
   echo "✅ Erfolgreich verbunden!"
else
   echo "❌ Verbindung fehlgeschlagen."
fi
