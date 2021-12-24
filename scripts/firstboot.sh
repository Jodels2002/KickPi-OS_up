#!/bin/bash
# Install KickPi-OS
# B.Titze 2021
# sudo package installer, rom , change bootpic


LED
       
       sudo chmod -R 777 /home/$USER/.bashrc
       sudo cp  /opt/KickPi-OS/config/rc.local /etc/
       sudo cp  /opt/KickPi-OS/config/splash/AmigaFirst.png /etc/systemd/system/Booting.png
       
       sudo rm -rf ~/KickPi-OS
       sudo rm -rf ~/.bash_history
       sudo rm -rf ~/.cache/mozilla/
       sudo rm -rf /home/pi/Templates/*
       sudo rm -rf /home/pi/.cache/chromium/
       sudo rm -rf /home/pi/.config/chromium/*
       mv  /home/pi/Amiga/dir/KickPi /home/pi/Documents/
       sudo rm -rf /home/pi/Amiga/dir/*
       mv   /home/pi/Documents/ /home/pi/Amiga/dir/KickPi
       sudo rm -rf /home/pi/Amiga/Install/*
      sudo rm -rf /home/pi/Amiga/kickstarts/*
LED_off

BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GRAY='\033[1;30m'

if [  -d "/boot/Shared/" ]; then
	
  
	  clear
      toilet "KickPi-OS" --metal
      echo -e "$GRAY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
	  echo -e "$BLACK  "
	  echo -e "$BLUE             AmigaForever * by Cloanto "
	  echo -e "$BLACK  "
	  echo -e "$BLACK 1>Please note that the Kickroms and Workbench"
	  echo -e "$BLACK 1>are still under copyright!" 
      echo -e "$BLACK 1>  "   
	  echo -e "$BLACK 1>Assign >NIL: Greetings your´s B. Titze "
	  echo -e "$GREEN "
	  echo "        **** Amiga Forever files found ****"
	  echo "        ***   copy files and activate   ***"
sleep 8
      sudo rsync -av --ignore-existing /boot/Shared/* ~/Amiga 
      sudo chmod -R 777 /home/pi/Amiga/
      sudo cp  -rf  /home/pi/Amiga/rom/amiga-os-310-a1200.rom /home/pi/Amiga/kickstarts/kick31a1200.rom
      sudo mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
      sudo rm -d /home/pi/Amiga/rom/
      clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
  	 
      echo ""   
fi
sudo rm -rf /home/$USER/.bashrc
cp -rf /opt/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_expand_rootfs

    
sudo reboot now
