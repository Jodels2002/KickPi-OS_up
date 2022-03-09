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
      if [ ! -f /home/pi/OLED.txt ]; then
      
      sudo cp -rf /opt/KickPi-OS/OLED/OLED.txt /home/pi/
            dialog --title "Did you have a OLED Display installed? " \
            --backtitle "KichPi-OS OLED switcher" \
            --yesno "\n If you don't have a OLED Display,\n please answer with no. \n  \n <Errno 121 Remote I/O error> " \ 10 60
            response=$?

            case $response in
                  1) 
	         echo "OLED disabled...."
	         sudo rm -rf /OLED
	         
	                           ;;
                  0) 
		  echo "Ok, OLED is installed"
		  sudo cp -rf /home/pi/KickPi-OS/OLED/ /
	          sudo chmod -R 777 /OLED/
   
                                    ;;

                  255) echo "[ESC] key pressed.";;
                           esac
           
      
      
      fi
      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo cp  /opt/KickPi-OS/config/splash/* /etc/systemd/system/
    
      sudo rm -rf /usr/share/applications/*Ami*
      sudo cp -R /home/$USER/KickPi-OS/config/Desktop/* /usr/share/applications/
      sudo cp -R /opt/KickPi-OS/config/config.txt /boot/config.txt
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      
      if [ -d /OLED/ ]; then
         sudo cp -rf /home/pi/KickPi-OS/OLED/ /
	 sudo chmod -R 777 /OLED/
      fi
      
      #sudo mv /usr/local/bin/uk /usr/local/bin/u
      
           
      if [ ! -d /home/pi/.config/autostart/ ]; then
      echo " Create Autostart "
      mkdir /home/pi/.config/autostart/
      fi
      #sudo cp -rf /opt/KickPi-OS/config/Keyboard.desktop /home/pi/.config/autostart/
      sudo cp -rf /opt/KickPi-OS/config/Desktop/KickPi-OS_Setup.desktop /home/pi/.config/autostart/
      
      
     LED
     # Dissable Services
     
     	sudo systemctl disable apt-daily-upgrade.service 
     	sudo systemctl disable apt-daily-upgrade.service
	sudo systemctl disable apt-daily-upgrade.timer
	sudo systemctl disable apt-daily.service
	sudo systemctl disable apt-daily.service
	sudo systemctl disable apt-daily.timer
	sudo systemctl disable cups
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
	sudo systemctl disable glamor-test.service
	sudo systemctl disable man-db.service 
	sudo systemctl disable man-db.service
	sudo systemctl disable man-db.timer
	sudo systemctl disable plymouth-reboot.service 
	sudo systemctl disable plymouth-start.service 
	sudo systemctl disable alsa-restore.service at boot time
	sudo systemctl disable alsa-state.service at boot time
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
	sudo systemctl disable rsyslog.service.
	sudo systemctl disable syslog.socket

	sudo systemctl disable service webmin
       
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
      echo "KickPi-OS Update Linux System ..."
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
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
      echo "KickPi-OS 64bit is running..."
      echo -e "$GREY "

      sudo update-rc.d motd remove
      else
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
      echo "Raspberry Pi OS 32 bit is running... "
      echo -e "$GREY "
    
      
fi    
                    
       LED_off
	sudo apt-get -y update
	
	sudo apt-get -y upgrade
	sudo apt -y autoremove
	LED     

# Update allways Routine
if [ ! -d /opt/KickPi-OS/ ]; then
      rm /home/$USER/Amiga/conf/retroarch.cfg
      
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
           
      sudo update-rc.d motd remove
      echo "Update is running "             
      echo " "
      echo " "      
      else 
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
      echo "Update is running "
      echo " "
      echo " System optimized :) "
      echo " "
      echo " " 
fi
       

     LED
 
	
	
if [ "$(getconf LONG_BIT)" == "64" ]; then
 # Only if Amiberry update hase made
   
        cd
	     
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
 	    
    
else
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
fi

if [ -f /home/pi/Desktop/AmigaForever9Plus.msi ]; then
AFimport.sh
fi
 
  if [ ! -f /home/pi/Amiga/kickstarts/amiga-os-310-a1200.rom ]; then
   sudo cp -R /home/pi/RetroPie/BIOS/MegaAGS-Kickstart.rom /home/pi/Amiga/kickstarts/kick31a1200.rom
  fi
   
   if [ -f /home/pi/Amiga/kickstarts/kick31a1200.rom ]; then
       
       if [ -d /OLED/ ]; then
          ClassicWB.sh
       fi
 
      if [ ! -f /home/pi/Amiga/dir/System_ADVSP/System/T/CWB3.pac ]; then
      install_ClassicWB.sh
      fi
   else
   
   clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
    
   fi

if [ ! -f /home/pi/Amiga/data/amiberry_dev.png ]; then
      sudo cp -R /opt/KickPi-OS/Amiga/amiberry_dev.png /home/pi/Amiga/data/
      fi
      
 if [ -d /home/pi/Documents/FS-UAE/Configurations/ ]; then
      #update.sh
     sudo cp -R /opt/KickPi-OS/config/fs-uae/* /home/pi/Documents/FS-UAE/Configurations/
 fi
 if [ -d /home/pi/FS-UAE/Configurations/ ]; then
      #update.sh
     sudo cp -R /opt/KickPi-OS/config/fs-uae/* /home/pi/FS-UAE/Configurations/
 fi
     
     
if [ -d /home/pi/pimiga/ ]; then
      #update.sh
     sudo mv /home/pi/pimiga/ /home/pi/pimiga15
    
fi
if [ -d /home/pi/pimiga15/ ]; then
     
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga15.uae /home/pi/Amiga/conf/
      #sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/pi/pimiga2/disks/System/Prefs/Env-Archive/Sys/
      #sudo chmod -R 777 /home/pi/pimiga15/disks/System/
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
fi
if [ -d /home/pi/pimiga20/ ]; then
      
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga2.uae /home/pi/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/configPimiga2.uae /home/pi/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/config/PimigaSS.uae /home/pi/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/config/Games Launcher.uae" /home/pi/Amiga/conf/
      #sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/pi/pimiga2/disks/System/Prefs/Env-Archive/Sys/
      #sudo chmod -R 777 /home/pi/pimiga2/disks/System/
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
    
    


if [ -d /home/pi/Amiga/dir/System_P96/ ]; then
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-P96.desktop /usr/share/applications/
fi

if [ -d /home/pi/Amiga/dir/System_ADVSP/ ]; then
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /usr/share/applications/ 
fi


      sudo cp  -rf  /home/pi/Amiga/amiberry /home/pi/Amiga/amiberry_old
   
if [ ! -f /home/pi/Desktop/gimp.desktop]; then
        sudo cp  -rf  /opt/KickPi-OS/config/gimp.desktop /usr/share/applications/
	sudo rm -rf /usr/share/applications/
        #sudo cp -rf /usr/share/applications/gimp.desktop /home/pi/Desktop/gimp.desktop
fi  
   
    clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " "
      echo "  ... repair settings  "  
      
      sudo rm -rf /home/$USER/.bashrc
      cp -rf /opt/KickPi-OS/scripts/.bashrc /home/$USER/.bashrc
   
      
      if [ ! -f /home/pi/Desktop/KickPi-OS.desktop ]; then
        sudo cp -rf /usr/share/applications/KickPi-OS.desktop /home/pi/Desktop/KickPi-OS.desktop
      fi  
      
      if [ ! -f /home/pi/Desktop/CLI.desktop ]; then
        sudo cp -rf /usr/share/applications/CLI.desktop /home/pi/Desktop/CLI.desktop
      fi 
      
      if [ ! -f /usr/share/applications/MegaAGS.desktop ]; then
      
      sudo cp -rf /opt/KickPi-OS/config/MegaAGS.desktop /usr/share/applications/ 
      cd
      wget https://github.com/midwan/amiberry/releases/download/v4.1.6/amiberry-v4.1.6-rpi4-sdl2-64bit-rpios.zip
      
      unzip -u  /home/$USER/amiberry-v4.1.6-rpi4-sdl2-64bit-rpios.zip
      sudo rm /home/pi/Amiga/amiberry_sdl
      cp -rf /home/pi/amiberry-rpi4-sdl2-64bit/amiberry  /home/pi/Amiga/amiberry_sdl
      sudo rm -rf /home/pi/amiberry-rpi4-sdl2-64bit/
      sudo rm -rf /home/$USER/amiberry-v4.1.6-rpi4-sdl2-64bit-rpios.zip
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      
      fi
      sudo cp -rf /opt/KickPi-OS/config/MegaAGS.desktop /usr/share/applications/ 
      #cd
      #unzip -u -o /opt/KickPi-OS/Amiga/Amiga.zip
      
      
  
      if [ ! -d /home/pi/Documents/ ]; then
      mkdir /home/pi/Documents/
      fi
      echo " "
      echo "  ... cleanup Amiga folder  " 
      sudo chmod -R 777 /home/$USER/Amiga
      echo " "
      echo "  ... delete unnecessary files  " 
      cd ~
      sudo find . -name "\._*" -type f -print0 | xargs -0 /bin/rm -f
      cd /home/pi/Amiga/
      sudo find . -name "_UAEFSDB.___" -type f -print0 | xargs -0 /bin/rm -f
      cd ~
      #sudo rm -rf ~/.cache/
      sudo rm -rf ~/KickPi-OS
      sudo rm -rf ~/Templates/*
      
       sudo rm -rf /etc/systemd/pstore.conf
       sudo rm -rf /etc/systemd/journald.conf
       sudo rm -rf /etc/systemd/system/network-online.target.wants/
       sudo rm -rf /etc/systemd/system/syslog.service
       sudo rm -rf /etc/systemd/system/lo*
       sudo rm -rf /etc/systemd/system/cu*
       sudo rm -rf /etc/systemd/system/plymouth-start.service
       sudo rm -rf /etc/systemd/system/multi-user.target.wants/cu*
       sudo rm -rf /etc/systemd/system/multi-user.target.wants/rsyslog.service
       sudo rm -rf /etc/systemd/system/printer.target.wants/

      echo " "
      echo "  ... repair rights  "         
    
      
      sudo chmod -R 777 /usr/local/bin/
      #sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      
      sudo chmod -R 777 /home/pi/Desktop/
      echo " "
      echo "  ... finish setup  " 
      sudo chmod -R 777 /usr/share/applications/

		
		if [ -d /OLED/ ]; then
		KickPi-OS.sh
		fi
 clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo -e "$BLACK "	
		
      sudo apt -f -y install
      sudo apt-get -y autoremove	
if  xset q &>/dev/null; then
      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
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
