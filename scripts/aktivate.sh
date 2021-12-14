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
	  echo -e  "$BLACK Check disk space..."
      if [ -f /media/pi/KICK/kick31a1200.rom ]; then
      
      echo -e "$BLACK 1.>$GREEN Found kick31a1200.rom from the Pimiga KICK partition  +"
    echo -e  ""
    return 0
  else
      echo -e " 1.>$RED No kick31a1200.rom $BLACK on Pimiga Pimiga KICK partition"
      echo -e  "$BLUE 1.> Copy first your kick31a1200.rom to folder KICK            -"
      echo -e  "Installation aborted... "
      echo -e  ""
      
     sleep 12
	
  whiptail --msgbox "Information: \n  \n  Pimiga * by Chris Edwards \n   \n See his instructions \n \n ..and donate him!" 20 50 1
  
 
 
    echo -e -n "$BLACK"
    echo "KickPI-OS ROM Operating System and Libraries" 
    echo "Version V1.5 2020-2021 KickPi-OS "
    echo ""

    echo -e  "CLI>"
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




if [[ $FREE -lt  40000000 ]]; then               # 10G = 10*1024*1024k

     echo -e  "Installation aborted..."
     echo -e  "$RED 1.> Not enough disk space !                            -"
     echo -e "$BLUE  1.> You need 40GB Avial left! " 
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
hdd_space
legal

sleep 2
clear

        echo "KickPI-OS ROM Operating System and Libraries" 
        echo "Version V1.5 2020-2021 KickPi-OS "
	echo -e  "CLI>Starting installation ..."
  
  sleep 5
