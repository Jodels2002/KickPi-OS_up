#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021
if  xset q &>/dev/null; then

FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h

      df --output=avail -h "$PWD" | sed '1d;s/[^0-9]//g'
      
    


      if [ -d /media/pi/rootfs/home/pi/pimiga/disks/Work/Commodore_Amiga_Tosec_Complete/ ]; then
      
      whiptail --msgbox "Information: \n  \n  Pimiga * by Chris Edwards \n  - please donate him :-) \n \n So now get some coffee or tea, \n   the copying process takes several minutes ... " 20 50 1

      sudo mkdir /home/pi/pimiga15/
      sudo mkdir /home/pi/pimiga15/disks/
      clear
      echo " "
      echo " "
      echo " Pimiga 1.5 MF found"
      echo "      ..copy files"

      sudo rsync -av --update /media/pi/rootfs/home/pi/pimiga/disks/ /home/pi/pimiga15/disks/
      Pimiga.sh 
      # Import Rom=s from WHDLoad
      #sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick33180.A500 /home/pi/Amiga/kickstarts/A500.rom
      #sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40063.A600 /home/pi/Amiga/kickstarts/A600.rom
      #sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.1200 /home/pi/Amiga/kickstarts/A1200.rom
      #sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.4000 /home/pi/Amiga/kickstarts/A4000.rom
      Pimiga.sh 
      sudo cp  -rf  /media/pi/KICK/* /home/pi/Amiga/kickstarts/
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/conf/
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/kickstarts/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga15.uae /home/pi/Amiga/conf/

      

      #sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/Mame0.34/roms/ /home/pi/RetroPie/roms/arcade/
      Pimiga.sh 
      #sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/GnGeo/roms/ /home/pi/RetroPie/roms/neogeo/
      #sudo cp -R -f -v /home/pi/pimiga/disks/System/Emulators/PocketSNES/roms/ /home/pi/RetroPie/roms/mastersystem/
      #sudo chmod -R 777 /home/pi/Desktop/ /home/pi/RetroPie/roms/

      Pimiga.sh 

 
   
      clear
      echo " "
      echo " "
      echo " Copy PM 1.5 finished "
      echo "      ..configure files ..."
      
      sudo chmod -R 777 /home/pi/pimiga15/
      sudo chmod -R 777 /home/pi/Amiga/kickstarts/

      echo " "
      echo " "
      echo "      ready ...fire up Pimiga"
      cd /home/pi/Amiga/  
 
 
      ./amiberry --config conf/Pimiga15.uae -G     
      
     
      
      else
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo " "
      echo " "
      echo "       No Pimiga 1.5 found."
      echo "        ... searching for Pimiga2.0 now..."
      fi 
       else
      cd
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo ""
      echo " "
      echo "       Pimiga importer must run in Desktop Mode "
      echo " "
      echo "       No Pimiga found."
      echo " "
      echo " ... please start desktop"
      
      echo " "
      
fi

if [ -d /media/pi/rootfs/home/pi/pimiga/disks/AGSYSTEM/ ]; then
    
      youtube_pm2.sh
      
      whiptail --msgbox "Information: \n  \n  Pimiga * by Chris Edwards \n  - please donate him :-) \n \n So now get some coffee or tea, \n the copying process takes several minutes ... " 20 50 1

      sudo mkdir /home/pi/pimiga2/
      sudo mkdir /home/pi/pimiga2/disks/
      clear
      echo " Found"
      echo " "
      toilet  Pimiga2X64
      echo " "
      echo "      ..copy files takes time..."
      echo " "
      echo " "

      sudo rsync -av --update /media/pi/rootfs/home/pi/pimiga/disks/ /home/pi/pimiga2/disks/
      Pimiga.sh 
      sudo rm -rf /home/pi/pimiga2/disks/AGSYSTEM/
      # Import Rom=s from WHDLoad
      #sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick33180.A500 /home/pi/Amiga/kickstarts/A500.rom
      #sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40063.A600 /home/pi/Amiga/kickstarts/A600.rom
      #sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.1200 /home/pi/Amiga/kickstarts/A1200.rom
      #sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.4000 /home/pi/Amiga/kickstarts/A4000.rom
      Pimiga.sh 
      sudo cp  -rf  /media/pi/KICK/* /home/pi/Amiga/kickstarts/
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/conf/
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/kickstarts/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga2.uae /home/pi/Amiga/conf/

 

      #sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/Mame0.34/roms/ /home/pi/RetroPie/roms/arcade/
      Pimiga.sh 
      #sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/GnGeo/roms/ /home/pi/RetroPie/roms/neogeo/
      #sudo cp -R -f -v /home/pi/pimiga/disks/System/Emulators/PocketSNES/roms/ /home/pi/RetroPie/roms/mastersystem/
      #sudo chmod -R 777 /home/pi/Desktop/ /home/pi/RetroPie/roms/

      Pimiga.sh 

 
   
      clear
      toilet  Pimiga2X64
      echo " "
      echo " Copy finished "
      echo "      ..configure files ..."
      
      sudo chmod -R 777 /home/pi/pimiga2/
      

      echo " "
      echo " "
      echo "      ready ...fire up Pimiga2"
      
      
      cd /home/pi/Amiga/  
 
      
      ./amiberry --config conf/Pimiga2.uae -G     
      
     
      
      else
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo " "
      echo " "
      echo "       No Pimiga found."
      fi 


if [ -d /media/pi/rootfs/home/pi/pimiga/ ]; then
      cd
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo ""
      echo "Type 'd' to boot into Kick-OS Workbench"
      echo ""
  
      else
      cd
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo ""
      echo "Type 'd' to boot into Kick-OS Workbench"
      echo ""

      echo " "
      echo "            Pimiga have to be mounted "
      echo " "
      echo "            No Pimiga found."
      echo " "
      echo " ... please follow instructions"
      
      echo " "
      
 fi
 
 sudo chmod -R 777 /home/pi/Desktop/
