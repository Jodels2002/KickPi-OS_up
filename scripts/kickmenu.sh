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

OPTIONS=(d "Boot to KickPi-OS Desktop"
         a "Boot to Amiga  (Amiberry)"
         c "Boot to CLI              "
         i "Install ClassicWB        "
         m "Import Pimiga            "  
         u "Update KickPi-OS         "
         n "Update Amiberry          "
         o "Update Amiberry   (DEV)  "
         r "Raspi-config             "
         s "Shutdown                 ")
        

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITL" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
   
       
   

cd ~

clear
toilet -F gay KickPi-OS

case $CHOICE in
        
        #1)
        #clear
        #toilet -F gay Amiberry
        #cd /home/$USER/Amiga
        # ./amiberry
     
 
        #    ;;
        
        d)
          # KickPi-OS Desktop
            clear
            toilet "KickPi-OS" --metal
            sudo rm /etc/profile.d/kick.sh
            sudo raspi-config nonint do_boot_behaviour B4
            
            ;;
        
                   
         a)
            clear
            toilet "Amiberry" --metal
             sudo cp -rf /opt/KickPi-OS/config/kick.sh /etc/profile.d/kick.sh
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
            
          n)
            #update
            clear
            Update_Amiberry.sh
            sudo apt-get -y install libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4
            sudo apt-get -y install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libraspberrypi-dev
            clear
            toilet "KickPi-OS" --metal
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
            make -j4 PLATFORM=rpi4-64-dmx
            sudo chmod -R 777 /home/$USER/amiberry
            cp -rf home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_sdl
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
            sudo rm -rf amiberry
           
            ;;  
       
       o)
            #update
            sudo apt-get -y install libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4
            sudo apt-get -y install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libraspberrypi-dev
            clear
            Update_Amiberry.sh
            toilet "KickPi-OS" --metal
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
            make -j4 PLATFORM=rpi4-64-dmx
            sudo chmod -R 777 /home/$USER/amiberry
            cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry_dev
            sudo rm -rf amiberry
         
            ;;  
            
            
esac


clear
toilet "KickPi-OS" --metal


