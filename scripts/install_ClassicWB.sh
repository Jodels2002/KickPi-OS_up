Update_Amiberry.sh

BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'

if [  -f /home/pi/Amiga/kickstarts/kick31a1200.rom]
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo ""
      echo -e -n "$GREEN Found kick31a1200.rom..."
      echo -e -n "$BLACK "
      sleep 4
     if [ ! -f /home/$USER/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      sudo python3 -m pip install -U pip
      sudo python3 -m pip install -U setuptools
      sudo pip install amitools  
      cd /home/pi/Amiga/adf/
      mkdir /home/pi/Amiga/dir/Work
      mkdir /home/pi/Amiga/Install/
      
      cd /home/pi/Amiga/Install
      
      clear
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      clear
      unzip -u ./ClassicWB_UAE_v28.zip
      clear
      cp -r -f  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      
        else 
        #clear
        echo "ClassicWB already downloaded"
      
      fi




if [ ! -d /home/pi/Amiga/dir/System_ADVSP ]; then
    
     clear
      toilet "ClassicWB" --metal
      echo " "
      echo " "
      echo "  Configure System_ADVSP ...   " 
      mkdir /home/pi/Amiga/dir/System_ADVSP
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_ADVSP.hdf unpack /home/pi/Amiga/dir/System_ADVSP
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/CWB3.pac /home/pi/Amiga/dir/System_ADVSP/System/T/
      cd /home/pi/Amiga/dir/System_ADVSP/System/T/
      unzip -u /home/pi/Amiga/dir/System_ADVSP/System/T/CWB3.pac
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_ADVSP/System/S/
      
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Science /home/pi/Amiga/dir/System_ADVSP/System/S/
      
      
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Work/Software /home/pi/Amiga/dir/System_ADVSP/System/
      
      cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /home/pi/Desktop/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /usr/share/applications/
     
     
     fi 
     
               
      


 cd /home/$USER/Amiga/hdf
      
      
      if [ ! -d /home/pi/Amiga/dir/System_P96/ ]; then
      
    
     clear
      
    
      
      echo " "
      echo " "
      echo "  Configure System_P96 ...   " 
      
      mkdir /home/pi/Amiga/dir/System_P96
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /home/pi/Amiga/dir/System_P96
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/CWB3.pac /home/pi/Amiga/dir/System_P96/System/T/
      cd /home/pi/Amiga/dir/System_P96/System/T/
      unzip -u /home/pi/Amiga/dir/System_P96/System/T/CWB3.pac
      
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Science /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/screenmode.prefs /home/pi/Amiga/dir/System_P96/System/Prefs/Env-Archive/Sys/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Work/Software /home/pi/Amiga/dir/System_P96/System/    
      
      cp -rf /opt/KickPi-OS/config/ClassicWB-P96.desktop /home/pi/Desktop/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-P96.desktop /usr/share/applications/
    
      else
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      fi
     
     
     return 0
      
     else
     
     return 1
     fi


      

    



