#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021
cd
clear
toilet "KickPi-OS" --metal
echo "KickPI-OS ROM Operating System and Libraries" 
echo "Version V1.5 2020-2021 KickPi-OS "
echo "No Rights Reserved.  "
echo ""
echo -e -n "$BLACK Check conditions to import Pimiga..."
echo ""

      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
 

export NEWT_COLORS='
    window=blue,lightgray
    border=white,gray
    textbox=black,gray
    button=black,white
    root=white,black
    border=black,lightgray
    shadow=black,gray
    title=gray,lightgray
    button=black,gray
    actbutton=white,lightgray
    compactbutton=black,lightgray
    checkbox=black,lightgray
    actcheckbox=lightgray,cyan
    entry=black,lightgray
    disentry=gray,lightgray
    label=gray,lightgray
    listbox=gray,lightgray
    actlistbox=black,cyan
    sellistbox=lightgray,black
    actsellistbox=lightgray,black
    textbox=black,lightgray
    acttextbox=black,cyan
    emptyscale=,gray
    fullscale=,cyan
    helpline=white,black
    roottext=lightgrey,black
'

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

legal()
{
	  	 
  if [ -f /media/pi/KICK/kick31a1200.rom ]; then
      sudo cp  -rf  /media/pi/KICK/* /home/pi/Amiga/kickstarts/
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/conf/
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/kickstarts/
      
      echo -e "$BLACK 1.>$GREEN Found kick31a1200.rom from the Pimiga KICK partition  +"
      echo -e  ""
  fi
  
  
  echo -e  "$BLACK Check kick31a1200.rom on Pimiga..."
  if [ -f /home/pi/Amiga/kickstarts/kick31a1200.rom ]; then
  
      echo -e "$BLACK 1.>$GREEN Found kick31a1200.rom from the Pimiga KICK partition  +"
      echo -e  ""
  sudo cp -R /home/pi/RetroPie/BIOS/MegaAGS-Kickstart.rom /home/pi/Amiga/kickstarts/kick31a1200.rom
  else
      toilet No KickROM
      echo -e " 1.>$RED No kick31a1200.rom $BLACK on Pimiga Pimiga KICK partition"
      echo -e  "$BLACK 1.> Copy first your kick31a1200.rom to folder KICK on Pimiga -"
      echo -e  ""
      echo -e  "Installation aborted... "
      echo -e  ""
      
     sleep 4
  
     youtube_pm2.sh   
    exit
  fi
}

hdd_space()

{
	echo -e  ""
	echo -e -n "$BLACK Check free disk space..." 
	echo -e "$BLUE "
	df -H -l /root
	echo -e -n " "
FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h 

if [[ $FREE -lt  30000000 ]]; then               # 10G = 10*1024*1024k

     echo -e  "Installation aborted..."
     echo -e  "$RED 1.> Not enough disk space !                            -"
     echo -e "$BLUE  1.> You need 30GB Avial left! " 
     echo -e "$BLACK 1.> "
     echo -e  ""
     echo -e  "Installation aborted... "
    sleep 20
      
      echo -e  ""
      # Make Space / thats live
	
	if [ -d /home/pi/pimiga15/disks/Work/Commodore_Amiga_Tosec_Complete/ ]; then
	echo -e "$BLUE Deleting Commodore_Amiga_Tosec_Complete... "
      		sudo rm -rf /home/pi/pimiga15/disks/Work/Commodore_Amiga_Tosec_Complete/Demos
      		
        fi
	
	
	
  whiptail --msgbox "Information: \n  \n  Installation aborted... \n   \n you need more disk space! \n \n ..only 64GB SD or USB?" 20 50 1
     exit 
     
     else
     echo -e "$BLACK 1.>$GREEN Enough free space:-) "  
     echo -e  ""   
              
fi 
}

      sudo cp  -rf  /home/pi/Amiga/amiberry /home/pi/Amiga/amiberry_old
      sudo cp  -rf  /opt/KickPi-OS/Amiga/amiberry /home/pi/Amiga/
      sudo cp  -rf  /opt/KickPi-OS/Amiga/amiberry_dev /home/pi/Amiga/
desktop

hdd_space
legal

sleep 2

        echo "KickPI-OS ROM Operating System and Libraries" 
        echo "Version V1.5 2020-2021 KickPi-OS "
	echo -e  "CLI>Starting installation ..."
    

sleep 2

if  xset q &>/dev/null; then

      if [ -d /media/pi/rootfs/home/pi/pimiga/disks/Work/Amiga_CD_Collection/ ]; then
      
      whiptail --msgbox "Information: \n  \n  Pimiga * by Chris Edwards \n  - please donate him :-) \n \n So now get some coffee or tea, \n   the import takes about an hour ... " 20 50 1

      if [ -d /home/pi/pimiga15/ ]; then
      clear
       toilet  Pimiga1.5MF
       echo -e "$BLUE  "
       echo "       Pimiga1.5 found :-) "
       echo -e "$BLUE           "
       echo -e "$BLUE Old Pimiga15 found...  "
       sudo rm -rf /home/pi/pimiga15/
       sudo mkdir /home/pi/pimiga15/
       sudo mkdir /home/pi/pimiga15/disks/
       
       else
       
       sudo mkdir /home/pi/pimiga15/
       sudo mkdir /home/pi/pimiga15/disks/
      fi
     
      clear
   
      
      
      echo -e "$GREY            ..copy files"
  
     	df -H -l /root
	echo -e -n " "
        FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h 

   if [[ $FREE -lt  70000000 ]]; then               # 10G = 10*1024*1024k
        echo -e  ""
	echo -e -n "$BLACK Low free disk space..." 
	echo -e -n " "
	echo -e "$BLUE Exclude Amiga_CD_Collection,Commodore_Amiga_Tosec_Complete"
	sleep 2

     sudo rsync -av --update --exclude={'Demos','*.mpg'} /media/pi/rootfs/home/pi/pimiga/disks/ /home/pi/pimiga15/disks/ 
     
         sudo rm -rf /home/pi/pimiga15/disks/Work/Commodore_Amiga_Tosec_Complete.info
	
      
     
     else
        echo -e -n "$BLACK More than 70 GB disk space..." 
	echo -e "$BLUE Copy also Amiga_CD_Collection and Commodore_Amiga_Tosec_Complete"
	sleep 2
        sudo rsync -av --update --exclude={'*.mpg'} /media/pi/rootfs/home/pi/pimiga/disks/ /home/pi/pimiga15/disks/       
    
    fi 
      
      Pimiga.sh 
      # Import Rom=s from WHDLoad
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick33180.A500 /home/pi/Amiga/kickstarts/A500.rom
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40063.A600 /home/pi/Amiga/kickstarts/A600.rom
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.1200 /home/pi/Amiga/kickstarts/A1200.rom
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.4000 /home/pi/Amiga/kickstarts/A4000.rom
      Pimiga.sh 
      sudo cp  -rf  /media/pi/KICK/* /home/pi/Amiga/kickstarts/
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/conf/
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/*.key /home/pi/Amiga/kickstarts/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga1.5.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/config/Pimiga15.uae /home/pi/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/pi/pimiga15/disks/System/Prefs/Env-Archive/Sys/screenmode.prefs
     

      #sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/Mame0.34/roms/ /home/pi/RetroPie/roms/arcade/
      Pimiga.sh 
      #sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/GnGeo/roms/ /home/pi/RetroPie/roms/neogeo/
      #sudo cp -R -f -v /home/pi/pimiga/disks/System/Emulators/PocketSNES/roms/ /home/pi/RetroPie/roms/mastersystem/
      #sudo chmod -R 777 /home/pi/Desktop/ /home/pi/RetroPie/roms/

      Pimiga.sh 
      
      clear
      echo " "
      echo " "
      echo -e "$BLACK Copy PM 1.5 finished "
      echo "    now.. configure files ..."
      
      sudo chmod -R 777 /home/pi/pimiga15/
      sudo chmod -R 777 /home/pi/Amiga/
      sudo chmod -R 777 /home/pi/Desktop/
      
      cd /home/pi/pimiga15/
      sudo find . -name "_UAEFSDB.___" -type f -print0 | xargs -0 /bin/rm -f

      echo " "
      echo " "
      echo -e "$GREEN      ready ...fire up Pimiga"
      cd /home/pi/Amiga/  
 
      ./amiberry --config conf/Pimiga15.uae -G     
                
      else
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo " "
      echo " "
      echo "       No Pimiga 1.5 found."
      echo "        ... searching for Pimiga2.0 now..."
      fi 
       else
      cd
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo " "
      echo " "
      echo "       Pimiga importer must run in Desktop Mode "
      echo " "
      echo "       No Pimiga found."
      echo " "
      echo " ... please start desktop"
      
      echo " "
      
fi


if [ -d /media/pi/rootfs/home/pi/pimiga/disks/AGSYSTEM/ ]; then
      clear
   
      # youtube_pm2.sh
      echo -e "$GREY "
      whiptail --msgbox "Information: \n  \n  Pimiga * by Chris Edwards \n  - please donate him :-) \n \n So now get some coffee or tea, \n the copying process takes several minutes ... " 20 50 1
      
      if [ -d /home/pi/pimiga2/ ]; then
       clear
       toilet  Pimiga1.5MF
       echo -e "$BLUE  "
       echo "Pimiga2.0 X64 found :-) "
       echo -e "$BLUE           "
       echo -e "$BLUE Old Pimiga2 found...  "
       sudo rm -rf /home/pi/pimiga2/
       sudo mkdir /home/pi/pimiga2/
       sudo mkdir /home/pi/pimiga2/disks/
       
       else
      
      sudo mkdir /home/pi/pimiga2/
      sudo mkdir /home/pi/pimiga2/disks/
      fi
      
      df -H -l /root
	echo -e -n " "
        FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h 

   if [[ $FREE -lt  40000000 ]]; then               # 10G = 10*1024*1024k
        echo -e  ""
	echo -e -n "$BLACK Less than 40GB disk space..." 
	
        # Make Space / thats live
	
	if [ -d /home/pi/pimiga15/disks/Work/Commodore_Amiga_Tosec_Complete/ ]; then
	echo -e "$BLUE Deleting Commodore_Amiga_Tosec_Complete... "
      		sudo rm -rf /home/pi/pimiga15/disks/Work/Commodore_Amiga_Tosec_Complete/
      		sudo rm -rf /home/pi/pimiga15/disks/Work/Commodore_Amiga_Tosec_Complete.info
        fi
	
	if [ -d /home/pi/pimiga15/disks/Work/Amiga_CD_Collection/ ]; then
	echo -e "$BLUE Deleting Amiga_CD_Collection... "
      		sudo rm -rf /home/pi/pimiga15/disks/Work/Amiga_CD_Collection/
      		sudo rm -rf /home/pi/pimiga15/disks/Work/Amiga_CD_Collection.info
	fi
      	
	if [ -d /home/pi/pimiga15/disks/Work/Videos/ ]; then
	echo -e "$BLUE Deleting Pimiga15 Videos... "
      		sudo rm -rf /home/pi/pimiga15/disks/Work/Videos/*.mpg
      	fi
      
     
     else
        
	echo -e  ""
	echo -e -n "$BLACK More than 40GB disk space..."           
    
    fi 
      
      clear
   
      toilet  Pimiga2.0
      echo -e "$BLUE  "
      echo "       Pimiga2.0 X64 found :-) "
      
      echo -e "$BLUE           ..copy files"
      
      echo " "
      echo " "
      echo -e "$GREY "
      	
      
      
      sudo rsync -av --update /media/pi/rootfs/home/pi/pimiga/disks/ /home/pi/pimiga2/disks/
      Pimiga.sh 
      # sudo rm -rf /home/pi/pimiga2/disks/AGSYSTEM/
      # Import Rom=s from WHDLoad
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick33180.A500 /home/pi/Amiga/kickstarts/A500.rom
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40063.A600 /home/pi/Amiga/kickstarts/A600.rom
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.1200 /home/pi/Amiga/kickstarts/A1200.rom
      sudo cp  -rf  /media/pi/rootfs/home/pi/pimiga/disks/System/Devs/Kickstarts/kick40068.4000 /home/pi/Amiga/kickstarts/A4000.rom
      Pimiga.sh 
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /home/pi/Desktop/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga20.desktop /usr/share/applications/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga2.uae /home/pi/Amiga/conf/
      sudo cp  -rf  /opt/KickPi-OS/config/Pimiga2.uae /home/pi/Amiga/conf/default.uae
      sudo cp  -rf  /opt/KickPi-OS/config/PimigaSS.uae /home/pi/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/config/Games Launcher.uae" /home/pi/Amiga/conf/
      sudo cp  -rf  "/opt/KickPi-OS/Amiga/screenmode.prefs" /home/pi/pimiga2/disks/System/Prefs/Env-Archive/Sys/screenmode.prefs
      cd /home/pi/pimiga2/disks/
      sudo cp  -rf  /opt/KickPi-OS/Amiga/pm/System.zip /home/pi/pimiga2/disks/
      unzip -u -o  /home/pi/pimiga2/disks/System.zip
      rm -rvf /home/pi/pimiga2/disks/System.zip
      clear
    

      #sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/Mame0.34/roms/ /home/pi/RetroPie/roms/arcade/ 
      #sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/GnGeo/roms/ /home/pi/RetroPie/roms/neogeo/
      #sudo cp -R -f -v /home/pi/pimiga/disks/System/Emulators/PocketSNES/roms/ /home/pi/RetroPie/roms/mastersystem/
      #sudo chmod -R 777 /home/pi/Desktop/ /home/pi/RetroPie/roms/

      Pimiga.sh 
      
      clear
      toilet  Pimiga2X64
      echo " "
      echo " Copy finished "
      echo "      ..configure files ..."
      
      sudo chmod -R 777 /home/pi/pimiga2/
      sudo chmod -R 777 /home/pi/Amiga/
      sudo chmod -R 777 /home/pi/Desktop/
      
      cd /home/pi/pimiga2/
      sudo find . -name "_UAEFSDB.___" -type f -print0 | xargs -0 /bin/rm -f
      
      echo " "
      echo " "
      echo "      ready ...fire up Pimiga2"
           
      cd /home/pi/Amiga/  
      
      ./amiberry --config conf/Pimiga2.uae -G     
          
      else
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo " "
      echo " "
      echo "       No Pimiga found."
      fi 

if [ -d /media/pi/rootfs/home/pi/pimiga/ ]; then
      cd
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo ""
      echo "Type 'd' to boot into Kick-OS Workbench"
      echo ""
  
      else
      cd
      clear
      toilet "KickPi-OS" --metal
      echo "KickPI-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 KickPi-OS "
      echo "No Rights Reserved.  "
      echo ""
      echo "Type 'd' to boot into Kick-OS Workbench"
      echo ""

      echo " "
      echo "            Pimiga have to be mounted "
      echo " "
      echo "            No Pimiga found."
      echo " "
      echo " ... please follow instructions"
      
      echo " "
      
      
      
 fi
 
     
