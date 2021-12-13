
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
echo -e -n "$BLACK Acitivating KickPi-OS..."
echo ""


BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'

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
	echo -e "$RED 1.>Scrict must run in Desktop mode!                           -"
	echo -e "$RED 1.>            -"
	echo -e "$RED 1.>First start the Linux desktop!                             -"
	echo -e "$RED 1.>            -"
	echo -e "$RED 1.>            -"



exit

fi
      
 }   


legal()
{
	  echo -e  "$BLACK Check AmigaForever9Plus..."
	  
	  if    [ ! -d "/media/pi/AMIGA/Shared/" ]; then
	 clear
         toilet "KickPi-OS" --metal
         echo " "
         echo " "
	else
	
	  clear
          toilet "KickPi-OS" --metal
          echo " "
          echo " "
	  echo "***  Amiga Forever files found ***"
	  echo " "
	  whiptail --msgbox "Information: \n  \n  AmigaForever9Plus * by Cloanto 
	  \n 1>	Please note that the Kickroms and Workbench files are still under copyright (Amiga Forever)! 
	  \n 1>	So only use this image if you own the original Amigas, Amiga Forever. 
	  \n 1>CLI:
	  \n 1>                  Greetings your´s 
	  \n 1>Assign >NIL:      B. Titze"
     
	  \n " 20 50 1
	   # whiptail --msgbox "Optional: \n  \n  Now insert your * AMIGA * USB stick with the \n  * Shared * folder into the Raspberry" 15 50 1
	  echo "... copy files will take 2-5 min "
          
	  cp -rf /media/pi/AMIGA/Shared/* ~/Amiga  
	  exit
	  fi
	  
	  
      if [ -f /home/pi/Desktop/AmigaForever9Plus.msi ]; then
      
      echo -e "$BLACK 1.>$GREEN Found AmigaForever9Plus  +"
    echo -e  ""
    return 0
  else
      echo -e " 1.>$RED No AmigaForever9Plus $BLACK on KickPi-OS Desktop"
      echo -e  "$BLUE 1.> Copy first your AmigaForever9Plus.msi your Desktop           -"
      echo -e  "Installation aborted... "
      echo -e  ""
      firefox https://www.amigaforever.com/
      
     sleep 12
	
  whiptail --msgbox "Information: \n  \n  AmigaForever9Plus * by Cloanto \n   \n " 20 50 1
  
 
 
    echo -e -n "$BLACK"
    echo "KickPI-OS ROM Operating System and Libraries" 
    echo "Version V1.5 2020-2021 KickPi-OS "
    echo ""

    echo -e  "CLI>"
   
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




if [[ $FREE -lt  4000000 ]]; then               # 10G = 10*1024*1024k

     echo -e  "Installation aborted..."
     echo -e  "$RED 1.> Not enough disk space !                            -"
     echo -e "$BLUE  1.> You need 4GB Avial left! " 
     echo -e "$BLACK 1.> "
     echo -e  ""
     echo -e  "Installation aborted... "
    sleep 20
      
      echo -e  ""

	
  whiptail --msgbox "Information: \n  \n  Installation aborted... \n   \n you need more disk space! \n \n ..only 64GB SD or USB?" 20 50 1
     exit 
     
     else
     echo -e "$BLACK 1.>$GREEN Enough free space:-) "  
     echo -e  ""   
     
     
     
fi 
}


desktop
sleep 3
hdd_space
sleep 3
legal

sleep 2


        echo "KickPI-OS ROM Operating System and Libraries" 
        echo "Version V1.5 2020-2021 KickPi-OS "
	echo -e  "CLI>Starting installation ..."
    

sleep 8





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
      
      fi         
      
#sudo rm -rf ~/Templates/*
