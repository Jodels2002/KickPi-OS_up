#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021 
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
      
      if [ ! -d /opt/Amiga/ ]; then
         sudo mkdir /opt/Amiga/
      fi      
      
      sudo chmod -R 777 /home/$USER/KickPi-OS
      sudo chmod -R 777 /opt/Backup/
      if [ ! -f /home/$USER/OLED.txt ]; then
      
      sudo cp -rf /opt/KickPi-OS/OLED/OLED.txt /home/$USER/
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
		  sudo cp -rf /home/$USER/KickPi-OS/OLED/ /
	          sudo chmod -R 777 /OLED/
		  loop.sh
   
                                    ;;

                  255) echo "[ESC] key pressed.";;
                           esac
           
      
      
      fi
      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo cp  /opt/KickPi-OS/config/splash/* /etc/systemd/system/
    
      sudo rm -rf /usr/share/applications/*Ami*
      sudo cp -R /home/$USER/KickPi-OS/config/Desktop/* /usr/share/applications/
      sudo cp -rf /home/$USER/KickPi-OS/config/Backgrounds/* /usr/share/backgrounds/ 
      sudo apt install -y samba cifs-utils
     
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      
      if [ -d /OLED/ ]; then
         sudo cp -rf /home/$USER/KickPi-OS/OLED/ /
	 sudo chmod -R 777 /OLED/
      fi
      
      #sudo mv /usr/local/bin/uk /usr/local/bin/u
      
           
      if [ ! -d /home/$USER/.config/autostart/ ]; then
      echo " Create Autostart "
      mkdir /home/$USER/.config/autostart/
      fi
      #sudo cp -rf /opt/KickPi-OS/config/Keyboard.desktop /home/$USER/.config/autostart/
      sudo cp -rf /opt/KickPi-OS/config/Desktop/KickPi-OS_Setup.desktop /home/$USER/.config/autostart/
      
      
     LED
 
	
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
      sudo apt-get update
      sudo apt-get upgrade -y
  
      
if [ -d /OLED/ ]; then
 update.sh
 fi
  
cd /home/$USER/KickPi-OS/

clear
   
                    
       LED_off

	loop.sh     

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

 
 

if [ -f /home/$USER/Desktop/AmigaForever9Plus.msi ]; then
AFimport.sh
fi
 
  if [ ! -f /home/$USER/Amiga/kickstarts/amiga-os-310-a1200.rom ]; then
   sudo cp -R /home/$USER/RetroPie/BIOS/MegaAGS-Kickstart.rom /home/$USER/Amiga/kickstarts/kick31a1200.rom
  fi
   
   if [ -f /home/$USER/Amiga/kickstarts/kick31a1200.rom ]; then
       
       if [ -d /OLED/ ]; then
          ClassicWB.sh
       fi
 
      if [ ! -f /home/$USER/Amiga/dir/System_ADVSP/System/T/CWB3.pac ]; then
      install_ClassicWB.sh
      fi
     
      if [ ! -f /home/$USER/Amiga/dir/System_ADVSP/System/T/CWB3.pac ]; then
      install_ClassicWB.sh
      fi
   
      if [ ! -f /home/$USER/Amiga/dir/ClassicWB13/System/T/Science ]; then
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

if [ ! -f /home/$USER/Amiga/data/amiberry_dev.png ]; then
      sudo cp -R /opt/KickPi-OS/Amiga/amiberry_dev.png /home/$USER/Amiga/data/
      fi
      

 if [ -d /home/$USER/FS-UAE/Configurations/ ]; then
      #update.sh
     sudo cp -R /opt/KickPi-OS/config/fs-uae/* /home/$USER/FS-UAE/Configurations/
 fi
 
 if [ -d /home/$USER/pimiga/ ]; then
      #update.sh
     sudo mv /home/$USER/pimiga/ /home/$USER/pimiga3
    
fi    
if [ -d /home/$USER/pimiga3/ ]; then
     
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga3.desktop /home/$USER/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga3.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga3.uae /home/$USER/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/$USER/pimiga3/disks/System/Prefs/Env-Archive/Sys/screenmode.prefs
      #sudo chmod -R 777 /home/$USER/pimiga15/disks/System/
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
fi     

if [ -d /home/$USER/pimiga/ ]; then
      #update.sh
     sudo mv /home/$USER/pimiga/ /home/$USER/pimiga15
    
fi
if [ -d /home/$USER/pimiga15/ ]; then
     
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /home/$USER/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga15.uae /home/$USER/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/$USER/pimiga15/disks/System/Prefs/Env-Archive/Sys/screenmode.prefs
      #sudo chmod -R 777 /home/$USER/pimiga15/disks/System/
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
fi
if [ -d /home/$USER/pimiga2/ ]; then
      
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /home/$USER/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga2.uae /home/$USER/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/configPimiga2.uae /home/$USER/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/config/PimigaSS.uae /home/$USER/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/config/Games Launcher.uae" /home/$USER/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/$USER/pimiga2/disks/System/Prefs/Env-Archive/Sys/screenmode.prefs
      #sudo chmod -R 777 /home/$USER/pimiga2/disks/System/
      cd /home/$USER/pimiga2/disks/
      sudo cp  -rf  /opt/KickPi-OS/Amiga/pm/System.zip /home/$USER/pimiga2/disks/
      unzip -o /home/$USER/pimiga2/disks/System.zip
      rm -rvf /home/$USER/pimiga2/disks/System.zip
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
    
fi   


if [ -d /home/$USER/Amiga/dir/System_P96/ ]; then
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/$USER/Amiga/conf/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-P96.desktop /usr/share/applications/
fi

if [ -d /home/$USER/Amiga/dir/System_ADVSP/ ]; then
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/$USER/Amiga/conf/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /usr/share/applications/ 
fi 



	     

            cp -rf  /opt/amiberry /opt/Backup/
	    cp -rf  /opt/amiberry-lite /opt/Backup/
	

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
   
      
      if [ ! -f /home/$USER/Desktop/KickPi-OS.desktop ]; then
        sudo cp -rf /usr/share/applications/KickPi-OS.desktop /home/$USER/Desktop/KickPi-OS.desktop
      fi  
      
      if [ ! -f /home/$USER/Desktop/CLI.desktop ]; then
        sudo cp -rf /usr/share/applications/CLI.desktop /home/$USER/Desktop/CLI.desktop
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
      

	   
     
     if [ -d /home/$USER/Documents/FS-UAE/Configurations/ ]; then
      #update.sh
     sudo cp -R /opt/KickPi-OS/config/fs-uae/* /home/$USER/Documents/FS-UAE/Configurations/
     fi     
  
      if [ ! -d /home/$USER/Documents/ ]; then
      mkdir /home/$USER/Documents/
      fi
      echo " "
      echo "  ... cleanup Amiga folder  " 
      sudo chmod -R 777 /home/$USER/Amiga
      echo " "
      echo "  ... delete unnecessary files  " 
      cd ~
      sudo find . -name "\._*" -type f -print0 | xargs -0 /bin/rm -f
      sudo find . -name "\.DS_*" -type f -print0 | xargs -0 /bin/rm -f
      cd /home/$USER/Amiga/
      sudo find . -name "_UAEFSDB.___" -type f -print0 | xargs -0 /bin/rm -f
      sudo find . -name "*.uaem" -type f -print0 | xargs -0 /bin/rm -f
      cd ~
      cd ~
      #sudo rm -rf ~/.cache/
      sudo rm -rf ~/KickPi-OS
      sudo rm -rf ~/Templates/*
      cp -rf  /opt/Backup/amiberry_dev /home/$USER/Amiga
 

      echo " "
      echo "  ... repair rights  "         
    
      
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Desktop/
      sudo chmod -R 777 /usr/share/applications/
      sudo chmod -R 777 /opt/
      
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
