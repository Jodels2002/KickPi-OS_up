if [ -d /OLED/ ]; then
cd /OLED
python3 Amiberry.py
fi
cd /home/pi/Amiga/
./amiberry_sdl --config conf/MegaAGS.uae -G


