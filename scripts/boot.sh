
if [ -d /media/pi/rootfs/home/pi/pimiga/disks/ ]; then
 
 cd /OLED
python3 pimiga.py
xfce4-terminal -e m

else

cd /OLED
python3 boot.py

 fi





