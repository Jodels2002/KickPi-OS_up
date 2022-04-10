#!/bin/bash
# Install KickPi-OS
# B.Titze 2021
  sudo apt-get -y install libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4
  sudo apt-get -y install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libraspberrypi-dev


Update_Amiberry.sh
  
  

 cd
 sudo rm -rf amiberry
 
 git clone -b dev https://github.com/midwan/amiberry
      # git clone https://github.com/midwan/amiberry
      cd amiberry

if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      toilet "KickPi-OS" --metal
      echo ""
      echo "Compiling Amiberry 64bit Dispmanx (DEV)"
      echo ""
    
      #make -j4 PLATFORM=rpi4-64-sdl2
      make -j4 PLATFORM=rpi4-64-dmx
    else 
      clear
      echo "Raspberry Pi OS 32 bit is running... "
      echo ""
      toilet "KickPi-OS" --metal

	      echo ""
	      echo "Raspberry Pi 4 SDL 32bit"
	     
	      make -j4 PLATFORM=rpi4


fi

sudo chmod -R 777 /home/$USER/amiberry/amiberry
cp -rf /home/$USER/amiberry/*  /home/pi/Amiga/
cp -rf /home/$USER/amiberry/amiberry  /home/pi/Amiga/amiberry_sdl

