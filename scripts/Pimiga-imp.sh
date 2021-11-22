#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021

pimigainst.sh
clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "            Pimiga importer             "
      echo " "
      echo "       Copy Pimiga files ..."
      echo " ... takes a while"
      echo " "


sudo mkdir /home/pi/pimiga/
sudo mkdir /home/pi/pimiga/disks/

sudo rsync -av --update /media/pi/rootfs/home/pi/pimiga/disks/ /home/pi/pimiga/disks/

# Import Rom=s from WHDLoad
sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick33180.A500 /home/pi/Amiga/kickstarts/A500.rom
sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40063.A600 /home/pi/Amiga/kickstarts/A600.rom
sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.1200 /home/pi/Amiga/kickstarts/A1200.rom
sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.4000 /home/pi/Amiga/kickstarts/A4000.rom

sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.rom /home/pi/Amiga/kickstarts/
sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/conf/
sudo cp  -rf  /opt/KickPi-OS/config/config/ /home/pi/Amiga/conf/
sudo cp  -rf  /usr/local/bin/A1200.uae /home/pi/Amiga/kickstarts/Pimiga.uae

 Pimiga.sh 

 
   
      clear
      echo " "
      echo " "
      echo " copy finished "
      echo "      ..configure files ..."
      
      sudo chmod -R 777 /home/pi/pimiga/
      sudo chmod -R 777 /home/pi/Amiga/kickstarts/

      echo " "
      echo " "
      echo "      ready ..."
 cd /home/pi/Amiga/     
 ./amiberry --config conf/Pimiga.uae -G     
      # sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/Mame0.34/roms/ /home/pi/RetroPie/roms/arcade/
      # sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/GnGeo/roms/ /home/pi/RetroPie/roms/neogeo/
      # sudo cp -R -f -v /home/pi/pimiga/disks/System/Emulators/PocketSNES/roms/ /home/pi/RetroPie/roms/mastersystem/
