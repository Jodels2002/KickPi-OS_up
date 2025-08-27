#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install NextStep Emulator https://layered.work/nextstep-on-rpi5-en/
# B.Titze 2025

BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
cd

sudo apt install -y \
build-essential \
cmake \
libasound2-dev \
libaudiofile-dev \
libdbus-1-dev \
libdirectfb-dev \
libgl1-mesa-dev \
libglu1-mesa-dev \
libopenal-dev \
libpcap-dev \
libpng-dev \
libpulse-dev \
libsdl2-dev \
libslirp-dev \
libts-dev \
libudev-dev \
subversion \
zlib1g-dev

svn checkout https://svn.code.sf.net/p/previous/code/trunk previous
cd previous && ./configure
make && sudo make install



