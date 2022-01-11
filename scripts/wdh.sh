#!/bin/bash
# Install KickPi-OS
# B.Titze 2020

BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'


FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h
if [[ $FREE -lt 33554432 ]]; then               # 32G = 10*1024*1024k
    
    echo "Less than 32GB free!"
     
    else 
 
    echo "More than 32GB free!"
    clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
  	 
      echo -e "$GREY " 


find . -type f -name 'igame.iff' | sed -r 's|/[^/]+$||' |sort |uniq > ~/G.txt
awk '{print $0"/"}' /home/pi/G.txt > /home/pi/Game.txt
sudo rm -rf ~/G.txt

##
declare -a arr=( "Demo" "Demos" "CDTV" "De" "Fr" "Es" "It" "Gr" "AGA" "CD32" "OCS" )

for i in "${arr[@]}"
do

   Dest="~/Amiga/dir/Games/WHDLoad_Games/"$i
    if [ ! -d ~/Amiga/dir/Games/WHDLoad_Games/"$i" ]; then
    
        mkdir ~/Amiga/dir/Games/
        mkdir ~/Amiga/dir/Games/WHDLoad_Games/
        mkdir ~/Amiga/dir/Games/WHDLoad_Games/"$i"
   fi
   
   echo "Creating New WHDLoad folder "$Dest" "
   grep "$i/" /home/pi/Game.txt > tmp.txt
   grep "$i/" /home/pi/Game.txt
  
   
   awk -v var=$Dest '{print $0 " " var}' tmp.txt > tmp1.txt
   awk '$0="cp -r "$0' tmp1.txt > "$i".sh
   chmod -R 777 "$i".sh
   ./"$i".sh
   sudo rm -rf ~/"$i".sh
   sudo rm -rf ~/tmp.txt
   sudo rm -rf ~/tmp1.txt
done
fi;
