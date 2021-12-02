
if [ -f /home/pi/Desktop/AmigaForever9Plus.msi ]; then

sudo apt install -y msitools
cd /home/pi/Templates/
msiextract /home/pi/Desktop/AmigaForever9Plus.msi

cp -r -f "/home/pi/Templates/Program Files/Cloanto/Amiga Forever/Shared/"* /home/pi/Amiga/
mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
rm -d /home/pi/Amiga/rom/

 cd
sudo chmod -R 777 Amiga

if [ ! -d /home/pi/Amiga/Install/WB ]; then
      sudo python3 -m pip install -U pip
      sudo python3 -m pip install -U setuptools
      sudo pip install amitools  
      
      cd /home/pi/Amiga/adf/
      mkdir /home/pi/Amiga/dir/Work
      mkdir /home/pi/Amiga/dir/WB
      mkdir /home/pi/Amiga/Install/WB
      mkdir /home/pi/Amiga/Install/
      

      xdftool amiga-os-310-workbench.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Workbench3.1/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-extras.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Extras3.1/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-fonts.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Fonts/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-locale.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Locale/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-storage.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Storage3.1/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-install.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Install3.1/* /home/pi/Amiga/dir/WB/
     fi 
       mkdir /home/$USER/Amiga/conf/ 
               
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
      echo " "
      
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
      
      cp -rf /home/pi/Amiga/Install/WB/ /home/pi/Amiga/dir/System_ADVSP/System/T/Workbench31
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Work/Software /home/pi/Amiga/dir/System_ADVSP/System/
      
      
      echo " "
      echo " "
      echo "  Configure System_P96 ...   " 
      
      mkdir /home/pi/Amiga/dir/System_P96
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /home/pi/Amiga/dir/System_P96
      cp -rf /home/pi/Amiga/Install/WB/ /home/pi/Amiga/dir/System_P96/System/T/Workbench31
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/User-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_P96/System/S/
      
      cp -rf /home/pi/Amiga/dir/System_ADVSP/System/Temp/* /home/pi/Amiga/dir/System_P96/System/Temp/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Work/Software /home/pi/Amiga/dir/System_P96/System/    
    
      else
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      fi
      




else
clear
fi
