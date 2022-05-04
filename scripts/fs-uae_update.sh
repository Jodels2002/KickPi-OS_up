#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2022
#*************************************************************************************************************

sudo apt install -y autoconf automake build-essential gettext \
libfreetype6-dev libglew-dev libglib2.0-dev libjpeg-dev libmpeg2-4-dev \
libopenal-dev libpng-dev libsdl2-dev libsdl2-ttf-dev libtool libxi-dev \
libxtst-dev zip zlib1g-dev

# Compile FS-UAE
cd

git clone https://github.com/FrodeSolheim/fs-uae.git
sudo chmod -R 777 fs-uae
cd fs-uae
./bootstrap
CFLAGS="-g -O3 -march=armv8-a" \
CXXFLAGS="-g -O3 -march=armv8-a" \
./configure
make
sudo cp -rf /home/pi/fs-uae/fs-uae /usr/bin/fs-uae
sudo rm -rf /home/pi/fs-uae/

# Compile FS-UAE luncher

sudo apt install -y python3 python3-pillow python3-pyqt5 \
    python3-pyqt5.qtopengl python3-requests python3-opengl \
    python3-rx python3-typing-extensions
    
cd
git clone https://github.com/FrodeSolheim/fs-uae-launcher.git
sudo chmod -R 777 fs-uae
cd fs-uae-launcher
./bootstrap
./configure
make
sudo cp -rf /home/pi/fs-uae/fs-uae-launcher /usr/bin/fs-uae-launcher
sudo rm -rf /home/pi/fs-uae-launcher/
