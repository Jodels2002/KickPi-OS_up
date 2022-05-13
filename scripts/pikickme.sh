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
      if [ ! -d /opt/Backup/ ]; then
         sudo mkdir /opt/Backup/
      fi	 
      sudo chmod -R 777 /home/$USER/KickPi-OS
      sudo chmod -R 777 /opt/Backup/
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
 
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "

      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
	
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
      #sudo cp -R /opt/KickPi-OS/config/config.txt /boot/config.txt
      
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
      #sudo cp -R /opt/KickPi-OS/config/config32.txt /boot/config.txt
      
fi    
                    
       LED_off

	     

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
     
      if [ ! -f /home/pi/Amiga/dir/System_ADVSP/System/T/CWB3.pac ]; then
      install_ClassicWB.sh
      fi
   
      if [ ! -f /home/pi/Amiga/dir/ClassicWB13/System/T/Science ]; then
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
      sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/pi/pimiga15/disks/System/Prefs/Env-Archive/Sys/screenmode.prefs
      #sudo chmod -R 777 /home/pi/pimiga15/disks/System/
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
fi
if [ -d /home/pi/pimiga2/ ]; then
      
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga2.uae /home/pi/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/configPimiga2.uae /home/pi/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/config/PimigaSS.uae /home/pi/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/config/Games Launcher.uae" /home/pi/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/pi/pimiga2/disks/System/Prefs/Env-Archive/Sys/screenmode.prefs
      #sudo chmod -R 777 /home/pi/pimiga2/disks/System/
      cd /home/pi/pimiga2/disks/
      sudo cp  -rf  /opt/KickPi-OS/Amiga/pm/System.zip /home/pi/pimiga2/disks/
      unzip -u -o /home/pi/pimiga2/disks/System.zip
      rm -rvf /home/pi/pimiga2/disks/System.zip
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
    
fi   


if [ -d /home/pi/Amiga/dir/System_P96/ ]; then
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-P96.desktop /usr/share/applications/
fi

if [ -d /home/pi/Amiga/dir/System_ADVSP/ ]; then
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /usr/share/applications/ 
fi 

if [ "$(getconf LONG_BIT)" == "64" ]; then
      

      sudo cp  -rf  /home/pi/Amiga/amiberry /home/pi/Amiga/amiberry_old
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 64 bit is running..."
      
      #if [ ! -f /opt/Backup/amiberry-v5.1-rpi4-sdl2-64bit-rpios.zip ]; then    
      cd
      wget https://github.com/midwan/amiberry/releases/download/v5.1/amiberry-v5.1-rpi4-dmx-64bit-rpios.zip
      unzip -u  /home/$USER/amiberry-v5.1-rpi4-dmx-64bit-rpios.zip
      sudo rm /home/pi/Amiga/amiberry
      sudo rm -rf /home/pi/amiberry-rpi4-dmx-64bit/abr/
      sudo rm -rf /home/pi/amiberry-rpi4-dmx-64bit/external/
      cp -rf /home/pi/amiberry-rpi4-dmx-64bit/*  /home/pi/Amiga/
      sudo cp -rf /home/$USER/amiberry-v5.1-rpi4-dmx-64bit-rpios.zip /opt/Backup
      sudo rm -rf /home/pi/amiberry-rpi4-dmx-64bit/
      sudo rm -rf /home/$USER/amiberry-v5.1-rpi4-dmx-64bit-rpios.zip
      
      wget https://github.com/midwan/amiberry/releases/download/v5.1/amiberry-v5.1-rpi4-sdl2-64bit-rpios.zip
      unzip -u  /home/$USER/amiberry-v5.1-rpi4-sdl2-64bit-rpios.zip
      sudo rm /home/pi/Amiga/amiberry_sdl
      cp -rf /home/pi/amiberry-rpi4-sdl2-64bit/amiberry  /home/pi/Amiga/amiberry_sdl
      sudo cp -rf /home/$USER/amiberry-v5.1-rpi4-sdl2-64bit-rpios.zip /opt/Backup
      sudo rm -rf /home/pi/amiberry-rpi4-sdl2-64bit/
      sudo rm -rf /home/$USER/amiberry-v5.1-rpi4-sdl2-64bit-rpios.zip
       #fi   
    else 
      sudo cp  -rf  /home/pi/Amiga/amiberry /home/pi/Amiga/amiberry_old
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 32 bit is running... "
      
   if [ ! -f /home/pi/Amiga/amiberry_dev ]; then    
      
      cd
      
      sudo apt-get -y install libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4
            sudo apt-get -y install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libraspberrypi-dev
            clear
            Update_Amiberry.sh
            
            echo "KickPI-OS ROM Operating System and Libraries" 
            echo "Version V1.5 2020-2021 KickPi-OS "
            echo "No Rights Reserved.  "
            echo -e "$BLUE "
            echo "Compiling Amiberry (DEV)..."
            echo -e "$BLACK "
            cd
            sudo rm -rf amiberry
            git clone -b dev https://github.com/midwan/amiberry
            cd amiberry
	    
           clear
      	   toilet "KickPi-OS" --metal
      	   echo " "
      	   echo " "
      	   echo "Raspberry Pi OS 32 bit is running... "
      	   echo "rebooting now ..."
      	   make -j4 PLATFORM=rpi4
            sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry_dev
	    
	    # Backup
	    
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/Backup
   fi        
   if [ ! -f /opt/Backup/amiberry ]; then    
	    
	    cd
            sudo rm -rf amiberry
            git clone https://github.com/midwan/amiberry
            cd amiberry
	    	   

        	clear
      		toilet "KickPi-OS" --metal
      		echo " "
      		echo " "
      		echo "Raspberry Pi OS 32 bit is running... "
      		
      		make -j4 PLATFORM=rpi4
   	    
       
            sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry_dmx
	    
	  
	    cp -rf  /home/pi/Amiga/amiberry /opt/Backup/
            cp -rf  /home/pi/Amiga/amiberry_old /opt/Backup/
	
            cd
            sudo rm -rf amiberry
   
       fi 
	    
           
            sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry_dev
	    
	    # Backup
	  
	 
	    
            cd
            sudo rm -rf amiberry
      
       
      
fi    

            cp -rf  /home/pi/Amiga/amiberry_old /opt/Backup/
            cp -rf  /home/pi/Amiga/amiberry /opt/Backup/
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/Backup/
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/Backup /

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
      

	   
     
     if [ -d /home/pi/Documents/FS-UAE/Configurations/ ]; then
      #update.sh
     sudo cp -R /opt/KickPi-OS/config/fs-uae/* /home/pi/Documents/FS-UAE/Configurations/
     fi     
  
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
      sudo find . -name "\.DS_*" -type f -print0 | xargs -0 /bin/rm -f
      cd /home/pi/Amiga/
      sudo find . -name "_UAEFSDB.___" -type f -print0 | xargs -0 /bin/rm -f
      cd ~
      #sudo rm -rf ~/.cache/
      sudo rm -rf ~/KickPi-OS
      sudo rm -rf ~/Templates/*
      cp -rf  /opt/Backup/amiberry_dev /home/pi/Amiga
 

      echo " "
      echo "  ... repair rights  "         
    
      
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/pi/Amiga/
      sudo chmod -R 777 /home/pi/Desktop/
      sudo chmod -R 777 /usr/share/applications/
      
      echo " "
      echo "  ... finish setup  " 
         
      
      # Dissable Services
       if [  -f /etc/systemd/pstore.conf ]; then
        sudo systemctl disable apt-daily-upgrade.service 
	sudo systemctl disable apt-daily-upgrade.timer
	sudo systemctl disable apt-daily.service
	sudo systemctl disable apt-daily.timer
	sudo systemctl disable cups
     	sudo systemctl disable rsyslog.service.
	sudo systemctl disable syslog.socket
	sudo systemctl disable service webmin
        sudo systemctl disable glamor-test.service
	sudo systemctl disable man-db.service 
	sudo systemctl disable man-db.timer
	sudo systemctl disable plymouth-reboot.service 
	sudo systemctl disable plymouth-start.service 
	sudo systemctl disable alsa-restore.service at boot time
	sudo systemctl disable alsa-state.service at boot time    
        sudo update-rc.d motd remove
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
      fi
	
		if [ -d /OLED/ ]; then
		KickPi-OS.sh
		fi
 clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo -e "$BLACK "	
		
     	
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

startx

fi
