if [ ! -f /home/$USER/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      
      
      cd /home/pi/Amiga/Install
      
      clear
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      clear
      unzip -u ./ClassicWB_UAE_v28.zip
      clear
      cp -r -f  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      
        else 
      echo "ClassicWB already downloaded"
      
      fi




if [ ! -d /home/pi/Amiga/dir/System_ADVSP ]; then
     
     
     
     
     fi 
     
               
      


 cd /home/$USER/Amiga/hdf
      
      
      if [ ! -d /home/pi/Amiga/dir/System_P96/ ]; then
      
     
      clear
      toilet "ClassicWB" --metal
      echo " "
      echo " "
      echo "  Configure System_ADVSP ...   " 
      mkdir /home/pi/Amiga/dir/System_ADVSP
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_ADVSP.hdf unpack /home/pi/Amiga/dir/System_ADVSP
      mkdir /home/pi/Amiga/dir/System_ADVSP/System/T/Workbench31
      cp -rf /home/pi/Amiga/dir/WB/* /home/pi/Amiga/dir/System_ADVSP/System/T/Workbench31
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_ADVSP/System/S/
      # cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Work/Software /home/pi/Amiga/dir/System_ADVSP/System/
      
      cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /home/pi/Desktop/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /usr/share/applications/
    
      
      echo " "
      echo " "
      echo "  Configure System_P96 ...   " 
      
      mkdir /home/pi/Amiga/dir/System_P96
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /home/pi/Amiga/dir/System_P96
      mkdir /home/pi/Amiga/dir/System_P96/System/T/Workbench31
      cp -rf /home/pi/Amiga/dir/WB/* /home/pi/Amiga/dir/System_P96/System/T/Workbench31
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_P96/System/S/
      # cp -rf /opt/KickPi-OS/Amiga/ClassicWB/User-Startup /home/pi/Amiga/dir/System_P96/System/S/
      # cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_P96/System/S/
      
      cp -rf /home/pi/Amiga/dir/System_ADVSP/System/Temp/* /home/pi/Amiga/dir/System_P96/System/Temp/
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
      




else
clear
fi
