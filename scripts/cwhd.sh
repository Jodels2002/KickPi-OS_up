#!/bin/bash
# Install KickPi-OS
# B.Titze 2020

BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'

cd ~/Amiga/dir/Games/WHDLoad_Games/

find "$(pwd)" -name *.slave > ~/G.txt

declare -a arr=( "Data" "data" "DATA"  )

for i in "${arr[@]}"
do

   
   
   echo "Creating New WHDLoad folder "$Dest" "
   grep "$i/" /home/pi/~/G.txt > del.txt
done
