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
         u "Update KickPi-OS         "
         n "Update Amiberry          "
         i "Install ClassicWB        "
         m "Import Pimiga            "  
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
       amiberryup.sh
   
           fi
            ;;  
            
esac


clear
toilet "KickPi-OS" --metal


