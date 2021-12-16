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
	 
	   echo -e  "$BLACK Check Folder AmigaForever Shared on your Desktop "
if    [  -d "/home/pi/Desktop/Shared/" ]; then
	
	
	  clear
          toilet "KickPi-OS" --metal
          echo " "
          echo " "
	  echo "***  Amiga Forever files found ***"
	  echo " "
	  whiptail --msgbox "Information: AmigaForever * by Cloanto 
	  \n 1>Please note that the Kickroms and Workbench
	  files are still under copyright! 
	  \n 1>So only use this image if you own  
	  original Amiga(s) or Amiga Forever. 
	  \n 1>CLI:               
	  \n 1>Assign >NIL: Greetings your´s B. Titze
     
	  \n " 20 50 1
	   # whiptail --msgbox "Optional: \n  \n  Now insert your * AMIGA * USB stick with the \n  * Shared * folder into the Raspberry" 15 50 1
	  echo "... copy files will take 2-5 min "
          
	  sudo rsync -av --ignore-existing /home/pi/Desktop/Shared/* ~/Amiga 
	  
	  return 1
	  
          else
	  toilet No Shared on Desktop
          echo " "
          echo " "
	  echo "***  No Amiga Forever Shared files found ***"
	  echo " "
	  echo -e  "Copie first your  * Shared * folder to your Desktop "
	  exit
	  fi
 
}



desktop
sleep 3

legal
sleep 8
/home/pi/Desktop/
sudo cp -R /opt/KickPi-OS/Amiga/AF/* /home/pi/Amiga/conf/
echo -e  "$BLACK "

  clear
          toilet "KickPi-OS" --metal
          echo " "
          echo " "
	  echo "***  Amiga Forever files found ***"
	  echo " "
	  echo "... copy files will take 2-5 min "
          mkdir /home/$USER/Amiga 
	  cp -rf /home/pi/Desktop/Shared/* ~/Amiga 

	echo -e  "$BLACK "
	echo "KickPI-OS ROM Operating System and Libraries" 
        echo "Version V1.5 2020-2021 KickPi-OS "
	echo -e  "CLI>Amiga files successfully updated ..."
	sleep 3 

	sudo chmod -R 777 /home/pi/Amiga/ 
	cd /home/pi/Amiga/  
	./amiberry --config conf/"AmigaForever WB.uae" -G   
	  
