
#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021
#************************************************************************************************************


BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'
Update_Amiberry.sh
desktop()
{
if  xset q &>/dev/null; then

	echo -e "$BLACK 1.>$GREEN Runs in Desktop Mode                                +"

else
	echo -e "$RED 1.>Script must run in Desktop mode!                           -"
	echo -e "$RED 1.>            -"
	echo -e "$RED 1.>First start the Linux Desktop!                             -"
	echo -e "$RED 1.>            -"
	echo -e "$RED 1.>            -"

exit

fi
      
 }   
 
 if [ -d /home/pi/Desktop/Shared/ ]; then
 
          
	  sudo rsync -av --ignore-existing /home/pi/Desktop/Shared/* ~/Amiga 
      sudo chmod -R 777 /home/pi/Amiga/
      sudo cp  -rf  /home/pi/Amiga/rom/amiga-os-310-a1200.rom /home/pi/Amiga/kickstarts/kick31a1200.rom
      sudo mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
      sudo rm -d /home/pi/Amiga/rom/
      clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
  	 
      echo ""   
      
      fi
      
if [  -d "/boot/Shared/" ]; then
	
  
	  clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
	  echo -e "$BLACK  "
	  echo -e "$BLUE             AmigaForever * by Cloanto "
	  echo -e "$BLACK  "
	  echo -e "$BLACK 1>Please note that the Kickroms and Workbench"
	  echo -e "$BLACK 1>are still under copyright!" 
      echo -e "$BLACK 1>  "   
	  echo -e "$BLACK 1>Assign >NIL: Greetings your´s B. Titze "
	  echo -e "$GREEN "
	  echo "        **** Amiga Forever files found ****"
	  echo "        ***   copy files and activate   ***"
sleep 3
      sudo rsync -av --ignore-existing /boot/Shared/* ~/Amiga 
      sudo chmod -R 777 /home/pi/Amiga/
      sudo cp  -rf  /home/pi/Amiga/rom/amiga-os-310-a1200.rom /home/pi/Amiga/kickstarts/kick31a1200.rom
      sudo mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
      sudo rm -d /home/pi/Amiga/rom/
      clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
  	 
      echo ""   
fi

 if [ ! -d /home/pi/Amiga/Install/DF0 ]; then
      cd /home/pi/Amiga/adf/
      xdftool amiga-os-300-workbench.adf unpack /home/pi/Amiga/Install/
      mv /home/pi/Amiga/Install/Workbench3.0/ /home/pi/Amiga/Install/DF0
      rm -f /home/pi/Amiga/Install/W*.*
fi 

classicWB()
{
      ClassicWB.sh
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo ""
      echo -e -n "$GREEN Found Amiga Files ..."
      echo -e -n "$BLUE "
      sleep 3
       if [ ! -f /home/$USER/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
      
      
      sudo python3 -m pip install -U pip
      sudo python3 -m pip install -U setuptools
      sudo pip install amitools
      
      sudo chmod -R 777 /home/pi/Amiga/
      cd /home/pi/Amiga/adf/
      mkdir /home/pi/Amiga/dir/Work
      mkdir /home/pi/Amiga/dir/Work/Software
      mkdir /home/pi/Amiga/Install/
      
      cd /home/pi/Amiga/Install
      
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e -n "$BLUE Downloading  ClassicWB_UAE_v28..."
      echo ""
      echo -e "$GRAY "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      clear
      unzip -u ./ClassicWB_UAE_v28.zip
      clear
      cp -r -f  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      
    else 
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
        echo "ClassicWB already downloaded"
        cd /home/pi/Amiga/Install
        clear
        unzip -u ./ClassicWB_UAE_v28.zip
        clear
        cp -r -f  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      fi

if [ ! -d /home/pi/Amiga/dir/System_ADVSP ]; then
mkdir /home/pi/Amiga/dir/System_ADVSP
fi
    ClassicWB.sh
     clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo " "
      echo -e -n "$BLUE "
      echo "  Configure System_ADVSP ...   " 
      
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
      
     
     #fi 

 cd /home/$USER/Amiga/hdf
      
      
      if [ ! -d /home/pi/Amiga/dir/System_P96/ ]; then
      mkdir /home/pi/Amiga/dir/System_P96
      fi
     
      ClassicWB.sh
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e -n "$BLUE "
      echo "  Configure System_P96 ...   " 
      
      
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
      cp -rf /home/pi/Amiga/dir/System_P96/System/Prefs/Patterns/Amiga_1024x768.jpg /home/pi/Amiga/dir/System_P96/System/Prefs/Patterns/bsg_pm2_800x600.png
      
     
   # fi
   # cp -r -f  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
   
   cd /home/pi/Amiga/dir/
   unzip -u /opt/KickPi-OS/Amiga/Amiga1000.zip
   cp -rf "/opt/KickPi-OS/Amiga/ClassicWB/Amiga1000.uae" /home/pi/Amiga/conf/
   cp -rf "/opt/KickPi-OS/Amiga/ClassicWB/Aros.uae" /home/pi/Amiga/conf/
   cp -rf "/opt/KickPi-OS/Amiga/ClassicWB/Aros.uae" /home/pi/Amiga/conf/
   

}


#desktop
    
ClassicWBLight()
{

 ClassicWB.sh
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e -n "$BLUE Downloading  ClassicWB_UAE_v28..."
      echo ""
      echo -e "$GRAY "
if [ ! -f /home/$USER/Amiga/Install/ClassicWB_LITE_v28.zip ]; then

      cd /home/pi/Amiga/Install

      wget http://download.abime.net/classicwb/ClassicWB_LITE_v28.zip

      clear
      unzip -u ./ClassicWB_LITE_v28.zip
      clear
fi   


 

if [ ! -d /home/pi/Amiga/dir/ClassicWB13/ ]; then
      mkdir /home/pi/Amiga/dir/ClassicWB13

     
      ClassicWB.sh
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e -n "$BLUE "
      echo "  Configure ClassicWB13 ...   " 
      
      
      cd "/home/pi/Amiga/Install/ClassicWB_LITE_v28/"
      xdftool System.hdf unpack /home/pi/Amiga/dir/ClassicWB13
      cp -rf /home/pi/Amiga/Install/DF0/ /home/pi/Amiga/dir/ClassicWB13/System/T/
      
      
      #cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence13 /home/pi/Amiga/dir/ClassicWB13/System/S/Startup-Sequence
      #cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Science /home/pi/Amiga/dir/ClassicWB13/System/S/
      #cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/ClassicWB13/System/S/
      #cp -rf /opt/KickPi-OS/Amiga/ClassicWB/screenmode.prefs /home/pi/Amiga/dir/ClassicWB13/System/Prefs/Env-Archive/Sys/
      #cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      
      
      #cp -rf /opt/KickPi-OS/config/ClassicWB13.desktop /home/pi/Desktop/
      #sudo cp -rf /opt/KickPi-OS/config/ClassicWB13.desktop /usr/share/applications/
      #cp -rf /home/pi/Amiga/dir/ClassicWB13/System/Prefs/Patterns/Amiga_1024x768.jpg /home/pi/Amiga/dir/ClassicWB13/System/Prefs/Patterns/bsg_pm2_800x600.png


fi

}

if    [  -f  /home/pi/Amiga/kickstarts/kick31a1200.rom  ]; then
#classicWB
ClassicWBLight

else
clear
          toilet "KickPi-OS" --metal
          echo " "
          echo " "
	  echo "***  No Amiga Forever files found ***"
	  echo " "
	  whiptail --msgbox "Information: AmigaForever * by Cloanto 
	  \n 1>Please note that the Kickroms and Workbench
	  files are still under copyright! 
	  \n 1>So only use this image if you own  
	  original Amiga(s) or Amiga Forever. 
	  \n 1>CLI:               
	  \n 1>Assign >NIL: Greetings your´s B. Titze
     
	  \n " 20 50 1
	
	  
	  
	  echo " "
	  echo "***  No Amiga Forever Shared files found ***"
	  echo " "
	  echo -e  "Copie first your  * Shared * folder  "
	  echo -e  "from your Amiga Forever installation to your Desktop "
	  echo -e  " "
	  echo -e  "Or copy a legal 3.1 Rom as kick31a1200.rom to "
	  echo -e  "/home/pi/Amiga/kickstarts/kick31a1200.rom "
	  echo -e  " "
fi


    


