if [ ! -f /media/pi/KICK/kick31a1200.rom ]; then
      echo " No Pimiga SD inserted.. "
      
   
else
cd /OLED
python3 pimiga.py
cd /home/pi/Amiga/
./amiberry --config /opt/KickPi-OS/config/Pimiga.uae -G
