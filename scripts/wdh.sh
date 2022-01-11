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
cd 
    

echo "More than 32GB free!"

      clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
  	  echo " "
      echo -e "$GREY Now sorting .. " 


find . -type f -name 'igame.iff' | sed -r 's|/[^/]+$||' |sort |uniq > ~/G.txt
awk '{print $0"/"}' ~/G.txt > ~/Ga.txt
awk '{ print "\""$0"\""}' ~/Ga.txt > ~/Game.txt

        mkdir ~/Amiga/dir/Games/
        mkdir ~/Amiga/dir/Games/WHDLoad_Games/
        mkdir ~/Amiga/dir/Games/WHDLoad_Games/OCS/
##
declare -a arr=( "Demo" "Demos" "CDTV" "De" "Fr" "Es" "It" "Gr" "AGA" "CD32" "OCS" "Games")

for i in "${arr[@]}"
do

   Dest="~/Amiga/dir/Games/WHDLoad_Games/"$i
    if [ ! -d ~/Amiga/dir/Games/WHDLoad_Games/"$i" ]; then
    
        
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

# Cleanup NTSC
cd /home/pi/Amiga/dir/Games/WHDLoad_Games/

find . -type f -name 'igame.iff' | sed -r 's|/[^/]+$||' |sort |uniq > ~/G.txt
awk '{print $0"/"}' ~/G.txt > ~/Ga.txt
awk '{ print "\""$0"\""}' ~/Ga.txt > ~/Gamecp.txt

sudo rm -rf ~/G.txt
sudo rm -rf ~/Ga.txt
##
declare -a arr=( "NTSC" "PAL" )

for i in "${arr[@]}"
do

   Dest="~/Amiga/dir/Games/WHDLoad_Games/"$i

   
   echo "Creating New WHDLoad folder "$Dest" "
   grep "$i/" ~/Gamecp.txt > ~/tmp.txt
   grep "$i/" ~/Gamecp.txt
  
   
   awk -v var=$Dest '{print $0 " " var}' tmp.txt > tmp1.txt
   awk '$0="mv  "$0' ~/tmp1.txt > ~/"$i".sh
   chmod -R 777 "$i".sh
   ./"$i".sh
   sudo rm -rf ~/"$i".sh
   sudo rm -rf ~/tmp.txt
   sudo rm -rf ~/tmp1.txt
done
# Cleanup OCR
cd /home/pi/Amiga/dir/Games/WHDLoad_Games/OCS/
mv -f *AGA /home/pi/Amiga/dir/Games/WHDLoad_Games/AGA/
find . -name "*AGA*" -exec rm -r "{}" \;
fi;
cd /home/pi/Amiga/dir/Games/WHDLoad_Games/

find "$(pwd)" -name *.slave > ~/G.txt

declare -a arr=( "Data" "data" "DATA"  )

for i in "${arr[@]}"
do

grep "/$i/" ~/G.txt
ls | grep "/$i/" ~/G.txt | xargs rm -v
sudo rm -rf ~/G.txt
 clear 
done
sudo rm -rf ~/G.txt
sudo rm -rf ~/Ga.txt
sudo rm -rf ~/tmp.txt
sudo rm -rf ~/tmp1.txt
# All the rest of files .. 
diff ~/Game.txt ~/Gamecp.txt > diff.txt

 clear
      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
  	  echo " "
