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
         v "Install AmigaVision           "  
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
            
          v)
            #update
            clear
            vision
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
            #************************************************  Compile Amiberry         ************************************** 
            clear
     
                sudo apt install -y build-essential git cmake libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev libportmidi-dev libenet-dev
	    clear
            
           clear
      		toilet "Amiberry" --metal
      		echo " "
      		echo " "
       		echo "Compiling now ...Amiberry :-)"
            cd
	
            sudo rm -rf amiberry
            
	    git clone  https://github.com/midwan/amiberry
            cd amiberry

            cmake -B build && cmake --build build
		    # make -j8 PLATFORM=rk3588
		
            sudo chmod -R 777 $HOME/amiberry
	        
	        cp -rf /opt/Amiga/amiberry /opt/Amiga/amiberry_old
	        cp -rf $HOME/amiberry/build/amiberry  /opt/Amiga/amiberry
	        cp -rf $HOME/amiberry/data/ /opt/Amiga/
	        cp -rf $HOME/amiberry/plugins/ /opt/Amiga/
	        cp -rf $HOME/amiberry/external/ /opt/Amiga/
	        cp -rf $HOME/amiberry/whdboot/ /opt/Amiga/
	    
	       # Backup
	 
	    cp -rf  /opt/Amiga/amiberry_old /opt/Backup
            cp -rf  /opt/Amiga/amiberry /opt/Backup
	    cp -rf  /opt/Amiga/amiberry_dev /opt/Backup
	    cp -rf  /opt/Amiga/data/amiberry_dev.png /usr/share/applications/
	    cp -rf  /opt/AmiRock/Amiga/amiberry_dev.png /opt/Amiga/data/
      
	    
            cd
            rm -rf amiberry

           
            ;;  
       
       o)
            #update
             
	       sudo apt install -y build-essential git cmake libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev libportmidi-dev libenet-dev
		clear
      		toilet "Amiberry-light" --metal
      		echo " "
      		echo " "
       		echo "Compiling now ...Amiberry :-)"

            sudo rm -rf amiberry
	    sudo rm -rf amiberry-lite           
	    cd ~
            git clone https://github.com/BlitterStudio/amiberry-lite
            cd amiberry-lite

              cmake -B build && cmake --build build	    
	      # make -j4 PLATFORM=rpi4
		
            sudo chmod -R 777 $HOME/amiberry-lite
	        
	        cp -rf /opt/Amiga/amiberry_dev /opt/Amiga/amiberry_dev_old
	        cp -rf $HOME/amiberry-lite/build/amiberry  /opt/Amiga/amiberry_dev
	
	    
	       # Backup
	 
	    cp -rf  /opt/Amiga/amiberry_dev_old /opt/Backup
            cp -rf  /opt/Amiga/amiberry /opt/Backup
	    cp -rf  /opt/Amiga/amiberry_dev /opt/Backup
	    cp -rf  /opt/Amiga/data/amiberry_dev.png /usr/share/applications/
	   
      
	    
            cd
           # rm -rf amiberry
         
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



