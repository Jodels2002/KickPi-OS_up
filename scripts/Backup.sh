#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021

BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
cd
clear
toilet "KickPi-OS" --metal
echo "KickPI-OS ROM Operating System and Libraries" 
echo "Version V1.5 2020-2021 KickPi-OS "
echo "No Rights Reserved.  "
echo ""
echo -e -n "$BLACK Backup to mountet Device..."
echo ""
if [ -d /media/pi/Backup/  ]; then
      
      echo -e "$BLUE  "
      echo "       Backup Amiga Folder :-) "
      sudo mkdir /media/pi/Backup/Amiga/
      sudo rsync -av --update /home/pi/Amiga/  /media/pi/Backup/Amiga/
      sudo mkdir /media/pi/Backup/Documents/
      sudo rsync -av --update /home/pi/Documents/  /media/pi/Backup/Documents/
    
    
    else
    echo -e "$BLUE  "
      echo "No Backup Medium found "
      echo "Plug a USB Drive called "Backup" to the System ... "
    
    fi
    
