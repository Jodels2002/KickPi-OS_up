
if [ -f /home/pi/Desktop/AmigaForever9Plus.msi ]; then

sudo apt install -y msitools
cd /home/pi/Templates/
msiextract /home/pi/Desktop/AmigaForever9Plus.msi

cp -r -f "/home/pi/Templates/Program Files/Cloanto/Amiga Forever/Shared/"* /home/pi/Amiga/
mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
rm -d /home/pi/Amiga/rom/

 cd
sudo chmod -R 777 Amiga
else
clear
fi
