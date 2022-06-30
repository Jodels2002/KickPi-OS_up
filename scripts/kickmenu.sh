#!/bin/bash
# Install KickPi-OS
# B.Titze 2020

clear

BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'

HEIGHT=35
WIDTH=70
CHOICE_HEIGHT=8
BACKTITLE="Main"
TITLE="KickPI-OS ROM Operating System"
MENU="Version 3.1:"

OPTIONS=(d "Boot to KickPi-OS Desktop     "
         a "Boot to Amiga  (Amiberry)     "
         c "Boot to CLI                   "
         i "Install ClassicWB             "
         m "Import Pimiga 1.5 / 2.0       "  
         u "Update KickPi-OS              "
         n "Update Amiberry               "
         o "Update Amiberry (DEV)         "
         e "OLED Display enable/disable   "
         r "Raspi-config                  "
         p "Pi Setup Wizzard              "
         s "Shutdown                      ")
        

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITL" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
   
       
   

cd ~

clear


case $CHOICE in
        
        
        p)
            #Welcome Wizzard
            sudo -AE piwiz
            ;; 
        
        
        d)
          # KickPi-OS Desktop
            clear
            toilet "KickPi-OS" --metal
            sudo rm /etc/profile.d/kick.sh
            sudo raspi-config nonint do_boot_behaviour B4
            sudo cp -rf /opt/KickPi-OS/config/splash/MiniBooting.png /etc/systemd/system/Booting.png
            ;;
        
                   
         a)
            clear
            toilet "Amiberry" --metal
             sudo cp -rf /opt/KickPi-OS/config/kick.sh /etc/profile.d/kick.sh
             sudo cp -rf /opt/KickPi-OS/config/splash/KS31.png /etc/systemd/system/Booting.png
             sudo chmod -R 777 /etc/profile.d/kick.sh
             sudo raspi-config nonint do_boot_behaviour B2
             echo " "
             echo " "
             echo "System reboots to Amiga" 
             echo " "
             echo "Rebooting now..."
             sleep 7s
             reboot
            ;;
         
            
          c)
            #console
            clear
            toilet "KickPi-OS" --metal
            sudo rm /etc/profile.d/kick.sh
            sudo cp -rf /opt/KickPi-OS/config/splash/AmigaKickPi-OS.png /etc/systemd/system/Booting.png
            sudo raspi-config nonint do_boot_behaviour B2
            echo " "
            echo " "
            echo "System reboots next time to command line" 
            echo " "
            ;; 
                 
        
         s)
            #shutdown
            clear
            s
            ;; 
            
         r)
            #raspi-config
            clear
            sudo raspi-config
            ;; 
            
         i)
            
            clear
            
            install_ClassicWB.sh
            aktivate.sh
            ;; 
            
            
            
         u)
            #update
            clear
            u
            ;;  
            
          m)
            #update
            clear
            Pimiga-imp.sh
            ;;  
            
            
           e)
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
		  sudo cp -rf /opt/KickPi-OS/OLED/ /
	          sudo chmod -R 777 /OLED/
   
                                    ;;

                  255) echo "[ESC] key pressed.";;
                           esac
            ;;  
            
          n)
            #update
            clear
            Update_Amiberry.sh
            sudo apt-get -y install libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4
            sudo apt-get -y install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libraspberrypi-dev
            clear
            
            echo "KickPI-OS ROM Operating System and Libraries" 
            echo "Version V1.5 2020-2021 KickPi-OS "
            echo "No Rights Reserved.  "
            echo -e "$BLUE "
            echo "Compiling Amiberry..."
            echo -e "$BLACK "
            cd
            sudo rm -rf amiberry
            git clone https://github.com/midwan/amiberry
            cd amiberry
	    	    if [ "$(getconf LONG_BIT)" == "64" ]; then
      		clear
      		toilet "KickPi-OS" --metal
      		echo " "
      		echo " "
      		echo "Raspberry Pi OS 64 bit is running..."
      		echo "Compiling now ..."
      
     		make -j4 PLATFORM=rpi4-64-dmx
    
      else 
        	clear
      		toilet "KickPi-OS" --metal
      		echo " "
      		echo " "
      		echo "Raspberry Pi OS 32 bit is running... "
      		echo "Compiling now ..."
      			
		
REVCODE=$(sudo cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^ *//g' | sed 's/ *$//g')

if [ "$REVCODE" = "a02082" ]; then
    PIMODEL="Raspberry Pi 3 Model B, 1 GB RAM"
    echo "$PIMODEL ($REVCODE)"
    
            make -j4 PLATFORM=rpi3
	    
	    sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    
	    # Backup
	    mkdir /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/KickPi-OS/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/KickPi-OS/Backup
            cd
            sudo rm -rf amiberry
	    
     exit 0

fi
if [ "$REVCODE" = "a020d3" ]; then
    PIMODEL="Raspberry Pi 3 Model B Plus, 1 GB RAM"
    echo "$PIMODEL ($REVCODE)"
            make -j4 PLATFORM=rpi3
	    
	    sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    
	    # Backup
	    mkdir /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/KickPi-OS/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/KickPi-OS/Backup
            cd
            sudo rm -rf amiberry
	    
     exit 0
fi
if [ "$REVCODE" = "9000C1" ]; then
    PIMODEL="Raspberry Pi Zero W"
    echo "$PIMODEL ($REVCODE)"
            make -j4 PLATFORM=rpi3
	    
	    sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    
	    # Backup
	    mkdir /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/KickPi-OS/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/KickPi-OS/Backup
            cd
            sudo rm -rf amiberry
	    
     exit 0
fi
            make -j4 PLATFORM=rpi4
	    
	    sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    
	    # Backup
	    mkdir /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/KickPi-OS/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/KickPi-OS/Backup
            cd
            sudo rm -rf amiberry
	    
     exit 0
   
       fi 
	    
	    
       
            sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    
	    # Backup
	    mkdir /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/KickPi-OS/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/KickPi-OS/Backup
            cd
            sudo rm -rf amiberry
           
            ;;  
       
       o)
            #update
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
	    
	    if [ "$(getconf LONG_BIT)" == "64" ]; then
      	clear
      	toilet "KickPi-OS" --metal
      	echo " "
      	echo " "
      	echo "Raspberry Pi OS 64 bit is running..."
      	echo "Compiling now ..."
      
     make -j4 PLATFORM=rpi4-64-dmx
    
    else 
        clear
      	toilet "KickPi-OS" --metal
      	echo " "
      	echo " "
      	echo "Raspberry Pi OS 32 bit is running... "
      	echo "Compiling now ..."
	
	
	REVCODE=$(sudo cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^ *//g' | sed 's/ *$//g')

if [ "$REVCODE" = "a02082" ]; then
    PIMODEL="Raspberry Pi 3 Model B, 1 GB RAM"
    echo "$PIMODEL ($REVCODE)"
    
            make -j4 PLATFORM=rpi3
	    
	    sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    
	    # Backup
	    mkdir /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/KickPi-OS/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/KickPi-OS/Backup
            cd
            sudo rm -rf amiberry
	    
     exit 0

fi
if [ "$REVCODE" = "a020d3" ]; then
    PIMODEL="Raspberry Pi 3 Model B Plus, 1 GB RAM"
    echo "$PIMODEL ($REVCODE)"
            make -j4 PLATFORM=rpi3
	    
	    sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    
	    # Backup
	    mkdir /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/KickPi-OS/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/KickPi-OS/Backup
            cd
            sudo rm -rf amiberry
	    
     exit 0
fi
if [ "$REVCODE" = "9000C1" ]; then
    PIMODEL="Raspberry Pi Zero W"
    echo "$PIMODEL ($REVCODE)"
            make -j4 PLATFORM=rpi3
	    
	    sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_old
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
	    
	    # Backup
	    mkdir /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/KickPi-OS/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/KickPi-OS/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/KickPi-OS/Backup
            cd
            sudo rm -rf amiberry
	    
     exit 0
fi
            make -j4 PLATFORM=rpi4
	    
	    sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry_dev
	    
	    
	    # Backup
	 
	    cp -rf  /home/pi/Amiga/amiberry_old /opt/Backup
            cp -rf  /home/pi/Amiga/amiberry /opt/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dev /opt/Backup
	    cp -rf  /home/pi/Amiga/amiberry_dmx /opt/Backup
	    
            cd
            sudo rm -rf amiberry
	    
    
            ;;  
            
            
esac


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
echo -e " 1.>  ( u ) KickPi-OS Update                        "
echo " 1.>  ( m ) KickPi-OS Config                        " 
echo -e " 1.>  ( c ) Raspi-Config                            "
echo " 1.>  ( s ) Shutdown                                "  
echo ""



