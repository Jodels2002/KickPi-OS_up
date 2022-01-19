
#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021
#************************************************************************************************************
Update_Amiberry.sh

BLACK='\033[0;39m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
GREY='\033[1;30m'

desktop()
{
if  xset q &>/dev/null; then

	echo -e "$BLACK 1.>$GREEN Runs in Desktop Mode                                +"
        sudo chmod -R 777 /home/pi/Amiga/
	sudo chmod -R 777 /opt/KickPi-OS/
	
else
	echo -e "$RED 1.>Script must run in Desktop mode!                           -"
	echo -e "$RED 1.>            -"
	echo -e "$RED 1.>First start the Linux Desktop!                             -"
	echo -e "$RED 1.>            -"
	echo -e "$RED 1.>            -"

exit
desktop
fi
      
 } 
 
WHDLoad()
{

if [ ! -d /home/pi/Amiga/Install/WHDLoad/Games]; then 
clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
	  echo -e "$BLACK  "
	  echo -e "$BLUE Downloading WHDLOAD Games/Demos "
	  echo -e "$BLACK  "

mkdir /home/pi/Amiga/Install/WHDLoad
mkdir /home/pi/Amiga/Install/WHDLoad/Games
mkdir /home/pi/Amiga/Install/WHDLoad/Demos
fi


if [ ! -f /usr/local/bin/gdown ]; then
sudo pip install gdown
fi
cd /home/pi/Amiga/Install/WHDLoad/Games

if [ ! -f /home/pi/Amiga/Install/WHDLoad/Games/OCS.zip ]; then
# Game OCS
gdown --id 12mNx9uZjiGY47mGN5It7oFjgttS7tZvm
fi
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Games/AGA.zip ]; then
# Game AGA
gdown --id 12oG6cmivWTtz_ZgcWHgxcBdRWo4J3d55
fi
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Games/CDTV.zip ]; then
# Game CDTV
gdown --id 12TU8U8L_3pe5Fg6A-u9PXLX1InbiCxBH
fi
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Games/NTSC.zip ]; then
# Game NTSC
gdown --id 12W_8pWRK5d2APJQoeNI7bxmVCBuQzOqc
fi
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Games/DE.zip ]; then
# Game DE
gdown --id 12TlX-Gupgp-a39UW0GbCZ0v5TtkPX-N4
fi
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Games/Es.zip ]; then
# Game Es
gdown --id 12nDQmzMcSSTv8g1LqEeVajPPK3Ooeo46
fi
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Games/Fr.zip ]; then
# Game Fr
gdown --id 12iNGyohOXHY5xHDO368M_Ly-l46gXU-8
fi
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Games/It.zip ]; then
# Game It
gdown --id 12gD2dQ0yKC75R-z98FxpdHU5G76KRNZz
fi

cd /home/pi/Amiga/Install/WHDLoad/Demos
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Demos/AGA.zip ]; then
# Demos AGA
gdown --id 12ycTm7EGRkLouuRMW896azGfKku3l1V3
fi
if [ ! -f /home/pi/Amiga/Install/WHDLoad/Demos/OCS.zip ]; then
# Demos OCS
gdown --id 12zOR1L6m9QhzvR3_L5DEJQIbPHvG8g42
fi

if [ ! -d /home/pi/Amiga/dir/Work/WHDLoad_Games/It ]; then 
clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
	  echo -e "$BLACK  "
	  echo -e "$BLUE Extracting WHDLOAD Games "
	  echo -e "$BLACK  "
mkdir /home/pi/Amiga/dir/Work/  
mkdir /home/pi/Amiga/dir/Work/WHDLoad_Games/
cd /home/pi/Amiga/dir/Work/WHDLoad_Games/

unzip -o /home/pi/Amiga/Install/WHDLoad/Games/OCS.zip 
unzip -o /home/pi/Amiga/Install/WHDLoad/Games/AGA.zip 
unzip -o /home/pi/Amiga/Install/WHDLoad/Games/CDTV.zip 
unzip -o /home/pi/Amiga/Install/WHDLoad/Games/NTSC.zip 
unzip -o /home/pi/Amiga/Install/WHDLoad/Games/DE.zip 
unzip -o /home/pi/Amiga/Install/WHDLoad/Games/Es.zip 
unzip -o /home/pi/Amiga/Install/WHDLoad/Games/Fr.zip 
unzip -o /home/pi/Amiga/Install/WHDLoad/Games/It.zip 

fi

if [ ! -d /home/pi/Amiga/dir/Work/WHDLoad_Demos/OCS ]; then 
clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
	  echo -e "$BLACK  "
	  echo -e "$BLUE Extracting WHDLOAD Demos "
	  echo -e "$BLACK  "
mkdir /home/pi/Amiga/dir/Work/  
mkdir /home/pi/Amiga/dir/Work/WHDLoad_Demos/
cd /home/pi/Amiga/dir/Work/WHDLoad_Demos/

unzip -o /home/pi/Amiga/Install/WHDLoad/Demos/AGA.zip 
unzip -o /home/pi/Amiga/Install/WHDLoad/Demos/OCS.zip 

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
sleep 2
      if [ ! -f /home/pi/Amiga/kickstarts/amiga-os-310-a1200.rom ]; then
           
      sudo rsync -av --ignore-existing /boot/Shared/* ~/Amiga 
      sudo cp  -rf  /home/pi/Amiga/rom/amiga-os-310-a1200.rom /home/pi/Amiga/kickstarts/kick31a1200.rom
      sudo mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
      sudo rm -d /home/pi/Amiga/rom/
      fi
      clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
  	 
      echo ""   
fi

 if [ ! -d /home/pi/Amiga/Install/DF0 ]; then
      #cd /home/pi/Amiga/adf/
      #xdftool amiga-os-300-workbench.adf unpack /home/pi/Amiga/Install/
      #mv /home/pi/Amiga/Install/Workbench3.0/ /home/pi/Amiga/Install/DF0
      #rm -f /home/pi/Amiga/Install/W*.*
     
     
      #CreateDF0
      sudo mkdir /home/pi/Amiga/Install/DF0
      cd /opt/KickPi-OS/Amiga/ClassicWB/
      unzip -o -q ./DF0.zip
      sudo mv /opt/KickPi-OS/Amiga/ClassicWB/DF0/* /home/pi/Amiga/Install/DF0
      sudo chmod -R 777 /home/pi/Amiga/Install/DF0
      rm -d -r /opt/KickPi-OS/Amiga/ClassicWB/DF0/
      #rm -d -r /home/pi/Amiga/Install/DF0/S
      #rm -d -r /home/pi/Amiga/Install/DF0/Prefs/
      rm -d -r /home/pi/Amiga/Install/DF0/*.info
 fi 

ClassicWB()
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
      echo "ClassicWB extracting... "
      unzip -o -q ./ClassicWB_UAE_v28.zip      
      echo ""
      echo -e "$GRAY "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
     
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
        
      fi

if [ ! -d /home/pi/Amiga/dir/System_ADVSP ]; then
mkdir /home/pi/Amiga/dir/System_ADVSP

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
      unzip -o -q /home/pi/Amiga/dir/System_ADVSP/System/T/CWB3.pac
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_ADVSP/System/S/
      
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Science /home/pi/Amiga/dir/System_ADVSP/System/S/
      
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Work/Software /home/pi/Amiga/dir/System_ADVSP/System/
      
      cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /home/pi/Desktop/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-ADVSP.desktop /usr/share/applications/
      
         
    fi
      
      if [ ! -d /home/pi/Amiga/dir/System_P96/ ]; then
      cd /home/$USER/Amiga/hdf
      mkdir /home/pi/Amiga/dir/System_P96
    
     
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
      unzip -o -q /home/pi/Amiga/dir/System_P96/System/T/CWB3.pac
      
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Science /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/screenmode.prefs /home/pi/Amiga/dir/System_P96/System/Prefs/Env-Archive/Sys/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Work/Software /home/pi/Amiga/dir/System_P96/System/ 
      
      
      cp -rf /opt/KickPi-OS/config/ClassicWB-P96.desktop /home/pi/Desktop/
      sudo cp -rf /opt/KickPi-OS/config/ClassicWB-P96.desktop /usr/share/applications/
      cp -rf /home/pi/Amiga/dir/System_P96/System/Prefs/Patterns/Amiga_1024x768.jpg /home/pi/Amiga/dir/System_P96/System/Prefs/Patterns/bsg_pm2_800x600.png
      
 fi
 if [ ! -f /home/pi/Amiga/dir/ClassicWB13/System/Devs/Kickstarts/kick40068.A1200 ]; then
      cd /opt/KickPi-OS/Amiga/ClassicWB/
      unzip -o -q ./whdpac.zip
      cp -rf  /opt/KickPi-OS/Amiga/ClassicWB/whdpac/* /home/pi/Amiga/dir/System_P96/System/
      cp -rf  /opt/KickPi-OS/Amiga/ClassicWB/whdpac/* /home/pi/Amiga/dir/System_ADVSP/System/
      rm -d -r /opt/KickPi-OS/Amiga/ClassicWB/whdpac/
 fi
 
 if [ ! -d /home/pi/Amiga/dir/Amiga1000/ ]; then
   cd /home/pi/Amiga/dir/
   unzip -u /opt/KickPi-OS/Amiga/Amiga1000.zip
   cp -rf "/opt/KickPi-OS/Amiga/ClassicWB/Amiga1000.uae" /home/pi/Amiga/conf/
   cp -rf "/opt/KickPi-OS/Amiga/ClassicWB/Aros.uae" /home/pi/Amiga/conf/
   cp -rf "/opt/KickPi-OS/Amiga/ClassicWB/Aros.uae" /home/pi/Amiga/conf/
 fi  
}
   
ClassicWB13()
{

 ClassicWB.sh
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      
if [ ! -f /home/$USER/Amiga/Install/ClassicWB_LITE_v28.zip ]; then
      echo -e -n "$BLUE Downloading  ClassicWB_UAE_v28..."
      echo ""
      echo -e "$GRAY "

      cd /home/pi/Amiga/Install

      wget http://download.abime.net/classicwb/ClassicWB_LITE_v28.zip

      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo "ClassicWB extracting... "
      unzip -o -q ./ClassicWB_LITE_v28.zip
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
      find /home/pi/Amiga/dir/ClassicWB13/ -type f -exec md5sum {} + | sort -k 2 > /home/pi/ClassicWB13.txt
      cp -rf /home/pi/Amiga/dir/ClassicWB13/System/T/Science /home/pi/Amiga/dir/ClassicWB13/System/S/Startup-Sequence
      cp -rf /home/pi/Amiga/Install/DF0/* /home/pi/Amiga/dir/ClassicWB13/System/
      cp -rf /home/pi/Amiga/dir/ClassicWB13/System/Temp/*.zip /home/pi/Amiga/dir/ClassicWB13/System/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB13/GamesMenu.menu /home/pi/Amiga/dir/ClassicWB13/System/System/BMenu/Files/GamesMenu/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB13/DemosMenu.menu /home/pi/Amiga/dir/ClassicWB13/System/System/BMenu/Files/DemosMenu/
      cp -rf /opt/KickPi-OS/Amiga/ClassicWB/ClassicWB-WB13.uae /home/pi/Amiga/conf/
      #WB1.3
      cd /home/pi/Amiga/dir/ClassicWB13/System/
      unzip -o -q ./WB13.zip
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
      echo -e "$BLACK  "
      #WHDLoad
      cd /opt/KickPi-OS/Amiga/ClassicWB/
      unzip -o -q ./whdpac.zip
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
      echo -e "$BLACK  "
      cp -rf  /opt/KickPi-OS/Amiga/ClassicWB/whdpac/* /home/pi/Amiga/dir/ClassicWB13/System/
      rm -d -r /opt/KickPi-OS/Amiga/ClassicWB/whdpac/
      rm -f /home/pi/Amiga/dir/ClassicWB13/System/*.zip
      rm -f /home/pi/Amiga/dir/ClassicWB13/System/T/*.*
      rm -f /home/pi/Amiga/dir/ClassicWB13/System/Temp/*.*
      
      #Symbolic Links
      cd /home/pi/Amiga/dir/ClassicWB13/System/
      rm -d -r /home/pi/Amiga/dir/ClassicWB13/System/Games
      ln -s /home/pi/Amiga/dir/Work/WHDLoad_Games/OCS/Games/ Games
      
      #cd /home/pi/Amiga/dir/ClassicWB13/System/
      rm -d -r /home/pi/Amiga/dir/ClassicWB13/System/Demos
      ln -s /home/pi/Amiga/dir/Work/WHDLoad_Demos/OCS/Demos/ Demos
            
      #cp -rf /opt/KickPi-OS/config/ClassicWB13.desktop /home/pi/Desktop/
      #sudo cp -rf /opt/KickPi-OS/config/ClassicWB13.desktop /usr/share/applications/
      #cp -rf /home/pi/Amiga/dir/ClassicWB13/System/Prefs/Patterns/Amiga_1024x768.jpg /home/pi/Amiga/dir/ClassicWB13/System/Prefs/Patterns/bsg_pm2_800x600.png
      
      find /home/pi/Amiga/dir/ClassicWB13/ -type f -exec md5sum {} + | sort -k 2 > /home/pi/ClassicWB13new.txt
      diff -u /home/pi/ClassicWB13.txt /home/pi/ClassicWB13new.txt| sort -k 2 > ClassicWB13diff.txt
      
fi

}

if    [  -f  /home/pi/Amiga/kickstarts/kick31a1200.rom  ]; then
desktop
WHDLoad
ClassicWB
ClassicWB13

else
clear
          toilet "KickPi-OS" --metal
          echo " "
	  echo " "
	  whiptail --msgbox "Information: AmigaForever * by Cloanto 
	  \n 1>Please note that the Kickroms and Workbench
	  files are still under copyright! 
	  \n 1>So only use this image if you own  
	  original Amiga(s) or Amiga Forever. 
	  \n 1>CLI:               
	  \n 1>Assign >NIL: Greetings your´s B. Titze
     
	  \n " 20 50 1
	  
	 echo -e "$RED ***  No valid Amiga KickRom found :-( ***"
	  echo " "
	  echo -e "$BLUE - Copie first your  * Shared * folder  "
	  echo -e  "   from your Amiga Forever installation to your KickPi-OS Desktop "
	  echo -e  " "
	  echo -e  " - Or copy a legal 3.1 Rom as kick31a1200.rom to "
	  echo -e  "   /home/pi/Amiga/kickstarts/kick31a1200.rom "
	  echo -e "$BLACK "
	  
	  
	  exit
fi
      rm -d -r /home/pi/Amiga/Install/DF0
      sudo chmod -R 777 /home/pi/Amiga/
      cd
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
      echo -e "$BLACK  "
      echo -e "$BLUE ClassicWBs createt "
      echo -e "$BLACK  "
    



