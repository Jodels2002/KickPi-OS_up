#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021 usr/share/images/desktop-base/desktop-grub.png
#*************************************************************************************************************
      #mkdir /home/$USER/.backup
      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
      sudo chmod -R 777 /home/$USER/KickPi-OS
      
      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
    
      sudo rm -rf /usr/share/applications/*Ami*
      sudo cp -R /home/$USER/KickPi-OS/config/Desktop/* /usr/share/applications/
      sudo cp -R /home/$USER/KickPi-OS/config/config.txt /boot/config.txt
      sudo cp -rf /home/pi/KickPi-OS/OLED/ /
      sudo mv /usr/local/bin/uk /usr/local/bin/u
      
           
      if [ ! -f /home/pi/.config/autostart/ ]; then
      echo " Create Autostart "
      mkdir /home/pi/.config/autostart/
      fi
      sudo cp -rf /opt/KickPi-OS/config/Keyboard.desktop /home/pi/.config/autostart/
      
      LED
       
      clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE "
      echo " "
      echo "            KickPi-OS Update Linux System ..."
      echo -e "$GREY "
      echo " "
      
if [ -d /OLED/ ]; then
 update.sh
 fi

cd /home/$USER/KickPi-OS/

clear

if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE "
      echo " "
      echo "KickPi-OS 64bit is running..."
      echo -e "$GREY "

      sudo update-rc.d motd remove
    else 
      clear
      toilet "KickPi-OS" --metal
      toilet "32 bit" --metal
      echo -e "$BLUE  "
      echo " "
      echo "Raspberry Pi OS 32 bit is running... "
      echo -e "$GREY "
    
      
fi    
      
     
       sudo cp -rf /home/pi/KickPi-OS/OLED/ /
       sudo chmod -R 777 /OLED/
       sudo chmod -R 777 /usr/share/applications/

         
       	LED
	sudo apt-get -y update
	LED_off
	sudo apt-get -y upgrade
	sudo apt -y autoremove
	LED     

# Update allways Routine
      if [ ! -d /opt/KickPi-OS/ ]; then
      rm /home/$USER/Amiga/conf/retroarch.cfg
      
      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo " "
           
      sudo update-rc.d motd remove
      echo "Update is running "             
      echo " "
      echo " "      
      else 
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "Update is running "
      echo " "
      echo " System optimized :) "
      echo " "
      echo " " 
       
      
      fi
       

 if [ -d /OLED/ ]; then
 #update.sh
 clear
 fi
	
      LED
 
	if [ -d /OLED/ ]; then
	Update_Retropie.sh
	fi
	
if [ "$(getconf LONG_BIT)" == "64" ]; then
 # Only if Amiberry update hase made
 
        Update_Amiberry.sh
        cd
  # cp -rf /home/$USER/KickPi-OS/Amiga/Amiga.zip /home/$USER
  #     unzip -o ./Amiga.zip
  #     rm ./Amiga.zip 
   
      
      
     
    
else
clear
fi

if [ -f /home/pi/Desktop/AmigaForever9Plus.msi ]; then
AFimport.sh
fi



if [ ! -f /home/pi/Amiga/data/amiberry_dev.png ]; then
      sudo cp -R /opt/KickPi-OS/Amiga/amiberry_dev.png /home/pi/Amiga/data/
      fi
      
   if [ -d /home/pi/Documents/FS-UAE/Configurations/ ]; then
      #update.sh
     sudo cp -R /opt/KickPi-OS/config/fs-uae/* /home/pi/Documents/FS-UAE/Configurations/
   fi
      
if [ -d /home/pi/pimiga/ ]; then
      #update.sh
     sudo mv /home/pi/pimiga/ /home/pi/pimiga15
    
fi
if [ -d /home/pi/pimiga15/ ]; then
     
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga15.uae /home/pi/Amiga/conf/
      sudo rm -rf /home/pi/pimiga2/disks/AGSYSTEM/
fi

if [ -d /home/pi/pimiga20/ ]; then
      
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga2.uae /home/pi/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/configPimiga2.uae /home/pi/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/config/PimigaSS.uae /home/pi/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/config/Games Launcher.uae" /home/pi/Amiga/conf/
fi
      sudo cp  -rf  /home/pi/Amiga/amiberry /home/pi/Amiga/amiberry_sdl

if [ ! -f /home/pi/Desktop/gimp.desktop]; then
        sudo cp  -rf  /opt/KickPi-OS/config/gimp.desktop /usr/share/applications/
	sudo rm -rf /usr/share/applications/
        #sudo cp -rf /usr/share/applications/gimp.desktop /home/pi/Desktop/gimp.desktop
fi  

cd ~

clear
      		toilet "KickPi-OS" --metal

      		echo " "
      		echo " "



      if [ -d /OLED/ ]; then
      update.sh
      fi
      echo -e "$BLUE  "
      echo "  ... cleanup and finish setup  "  
      echo -e "$GREY  "
      sudo rm -rf /home/$USER/.bashrc
      cp -rf /opt/KickPi-OS/scripts/.bashrc /home/$USER/.bashrc
      
      if [ ! -f /home/pi/Amiga/amiberry_dev ]; then
      cd /home/pi/Amiga/
      unzip -u  /opt/KickPi-OS/Amiga/amiberry_dev.zip
      sudo cp -rf /home/pi/Amiga/amiberry_dev /home/pi/Amiga/amiberry_sdl
      # unzip -u  /opt/KickPi-OS/Amiga/amiberry_dev.zip     
      fi    
      
      if [ ! -f /home/pi/Desktop/KickPi-OS.desktop ]; then
        sudo cp -rf /usr/share/applications/KickPi-OS.desktop /home/pi/Desktop/KickPi-OS.desktop
      fi  
      
    
      sudo rm -rf ~/.cache/
      sudo rm -rf ~/KickPi-OS
      sudo rm -rf ~/Templates/*
    
      
     
      sudo apt -f -y install
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga
      sudo chmod -R 777 /home/pi/Desktop/
      
      
      clear
      		toilet "KickPi-OS" --metal

      		echo " "
      		echo " "
		
		if [ -d /OLED/ ]; then
		KickPi-OS.sh
		fi
		
if  xset q &>/dev/null; then


cd
clear
toilet "KickPi-OS" --metal
echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
echo " Version V2.0 2020-2021 KickPi-OS "
echo " No Rights Reserved.  "
echo -e "$BLACK "
echo " Type 'd' to boot into Kick-OS Workbench"
echo ""
echo " 1.>  "
echo -e " 1.>  ( a ) Start Amiga                   *Amiberry*" 
echo " 1.>  ( d ) KickPi Desktop                          " 
echo -e " 1.>  ( e ) Emulationstation              *RetroPie*" 
echo " 1.>  ( r ) Emulationstation Setup                  "
echo -e "$GREEN 1.>  ( u ) KickPi-OS Update                        "
echo -e "$BLACK 1.>  ( m ) KickPi-OS Config                        " 
echo -e " 1.>  ( c ) Raspi-Config                            "
echo " 1.>  ( s ) Shutdown                                 "  
echo ""


	else 

startx


fi
