!/bin/bash
#***********************************************  #KickPi-OS  script  ***********************************
# Install KickPi-OS
# B.Titze 2021 
#*************************************************************************************************************
 

if [ ! -d /media/usb1/ ]; then
      
      echo " Create MoundDirs "
      mkdir /home/$USER/.config/autostart/
      
      sudo mkdir /media/usb1
      sudo mkdir /media/usb2
      sudo mkdir /media/usb3
      
      sudo chmod -R 777 /media/
      fi

sudo mount /dev/sda1 /media/usb1
sudo mount /dev/sda2 /media/usb2
sudo mount /dev/sda3 /media/usb3
