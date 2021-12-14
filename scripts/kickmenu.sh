#!/bin/bash
# Install KickPi-OS
# B.Titze 2020

clear


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
            
         i)
            #shutdown
            clear
            install_ClassicWB.sh
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
            if [ -d /OLED/ ]; then
       Update_Amiberry.sh
        cd
        sudo rm -rf amiberry
        git clone https://github.com/midwan/amiberry
        cd amiberry
        make -j4 PLATFORM=rpi4-64-dmx
        sudo chmod -R 777 /home/$USER/amiberry
        cp -rf home/pi/Amiga/amiberry  /home/pi/Amiga/amiberry_sdl
        cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry
        sudo rm -rf amiberry
           fi
            ;;  
       
       o)
            #update
            clear
            if [ -d /OLED/ ]; then
       Update_Amiberry.sh
        cd
        sudo rm -rf amiberry
        git clone -b dev https://github.com/midwan/amiberry
        cd amiberry
        make -j4 PLATFORM=rpi4-64-dmx
        sudo chmod -R 777 /home/$USER/amiberry
        cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry_dev
        sudo rm -rf amiberry
           fi
            ;;  
            
            
esac


clear
toilet "KickPi-OS" --metal


