#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021 usr/share/images/desktop-base/desktop-grub.png
#*************************************************************************************************************
      mkdir /home/$USER/.backup
      sudo chmod -R 777 /home/$USER/KickPi-OS
      
      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo cp -R /home/$USER/KickPi-OS/config/Desktop/* /usr/share/applications/
      sudo cp -R /home/$USER/KickPi-OS/config/config.txt /boot/config.txt
      
      sudo cp -rf /home/pi/KickPi-OS/OLED/ /
      sudo mv /usr/local/bin/uk /usr/local/bin/u
           
       LED
       
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      echo "Installing KickPi-OS Update System ..."
      echo " "
      echo " "
      
if [ -d /OLED/ ]; then
 update.sh
 fi

cd /home/$USER/KickPi-OS/

clear

if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "64 bit" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 64 bit is running..."
      echo ""

      sudo update-rc.d motd remove
    else 
      clear
      toilet "KickPi-OS" --metal
      toilet "32 bit" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 32 bit is running... "
      echo ""
    
      
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
      if [ ! -d /home/$USER/.KickPi-OS/ ]; then
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
 update.sh
 fi
	
      LED
 
	if [ -d /OLED/ ]; then
	Update_Retropie.sh
	fi
	
if [ "$(getconf LONG_BIT)" == "64" ]; then

   Update_Amiberry.sh
   cd
  cp -rf /home/$USER/KickPi-OS/Amiga/Amiga.zip /home/$USER
        unzip -o ./Amiga.zip
        rm ./Amiga.zip 
   

      
else
clear
fi
if [ -d /home/pi/pimiga/ ]; then
      update.sh
     sudo mv /home/pi/pimiga/ /home/pi/pimiga15
    
fi
if [ -d /home/pi/pimiga15/ ]; then
      update.sh
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga15.uae /home/pi/Amiga/conf/
      sudo rm -rf /home/pi/pimiga2/disks/AGSYSTEM/
fi

if [ -d /home/pi/pimiga20/ ]; then
      update.sh
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga2.uae /home/pi/Amiga/conf/
fi

cd ~

clear
      		toilet "KickPi-OS" --metal

      		echo " "
      		echo " "



      if [ -d /OLED/ ]; then
      update.sh
      fi
      
      echo "  ... cleanup and finish setup  "  
      sudo rm -rf /home/$USER/.bashrc
      cp -rf /home/$USER/KickPi-OS/scripts/.bashrc /home/$USER/.bashrc
      sudo cp  /home/$USER/KickPi-OS/config/rc.local /etc/
     
    
      sudo rm -rf ~/.cache/
      sudo rm -rf ~/KickPi-OS
    
      
     
      sudo apt -f -y install
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga
      
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
echo "KickPI-OS ROM Operating System and Libraries" 
echo "Version V1.5 2020-2021 KickPi-OS "
echo "No Rights Reserved.  "
echo ""
echo "Type 'd' to boot into Kick-OS Workbench"
echo ""
echo "1.>  "
echo "1.>  ( a ) Start Amiberry                          " 
echo "1.>  ( d ) KickPi Desktop                          " 
echo "1.>  ( e ) Emulationstation              (RetroPie)" 
echo "1.>  ( r ) Emulationstation Setup                  "
echo "1.>  ( u ) KickPi-OS Update                        "
echo "1.>  ( m ) Boot select                             " 
echo "1.>  ( c ) Raspi-Config                            "
echo "1.>  ( s ) Shutdown                                "  
echo ""
	else 

startx
fi
