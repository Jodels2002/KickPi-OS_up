#!/bin/bash
# Install KickPi-OS
# B.Titze 2020

# MD5 look at this >/( https://unix.stackexchange.com/questions/271506/remove-lines-that-contain-file-path-using-sed

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
      echo -e "$BLUE Search for WHDLoad Files .. "
      echo -e "$GREY " 

find . -type f -name '*.slave' | sed -r 's|/[^/]+$||' |sort |uniq > ~/new.txt
cp -R ~/new.txt ~/.config/
comm -23 ~/new.txt ~/.config/skip.txt  > ~/tmp.txt
echo "$(grep -v "./Amiga/dir/Work/WHDLoad_Games/" ~/tmp.txt)" > ~/tmp1.txt
echo "$(grep -v "./Amiga/dir/Work/WHDLoad_Games/" ~/tmp.txt)" > ~/tmp1.txt
echo "$(grep -v "./Amiga/dir/Work/WHDLoad_Demos/" ~/tmp1.txt)" > ~/G.txt
awk '{print $0"/"}' ~/G.txt > ~/Ga.txt
awk '{ print "\""$0"\""}' ~/Ga.txt > ~/Game.txt

if [ ! -d ~/Amiga/dir/Work/WHDLoad_Games/ ]; then
          mkdir ~/Amiga/dir/Work/
          mkdir ~/Amiga/dir/Work/WHDLoad_Games/
          mkdir ~/Amiga/dir/Work/WHDLoad_Games/OCS/       
fi
if [ ! -d ~/Amiga/dir/Work/WHDLoad_Demos/ ]; then
          mkdir ~/Amiga/dir/Work/
          mkdir ~/Amiga/dir/Work/WHDLoad_Demos/
          mkdir ~/Amiga/dir/Work/WHDLoad_Demos/OCS/  
          mkdir ~/Amiga/dir/Work/WHDLoad_Demos/AGA/  
fi
      
##
declare -a arr=( "Demo" "Demos" "CDTV" "De" "Fr" "Es" "It" "Gr" "AGA" "CD32" "OCS" "Games")

for i in "${arr[@]}"
do

   Dest="~/Amiga/dir/Work/WHDLoad_Games/"$i
    if [ ! -d ~/Amiga/dir/Work/WHDLoad_Games/"$i" ]; then
    
        mkdir ~/Amiga/dir/Work/WHDLoad_Games/"$i"       
   fi
   
   echo "Creating New WHDLoad folder "$Dest" "
   grep "$i/" ~/Game.txt > ~/tmp.txt
   grep "$i/" ~/Game.txt
  
   
   awk -v var=$Dest '{print $0 " " var}' ~/tmp.txt > ~/tmp1.txt
   awk '$0="cp -r "$0' tmp1.txt > "$i".sh
   chmod -R 777 "$i".sh
   ./"$i".sh
   sudo rm -rf ~/"$i".sh
  
done

# Cleanup NTSC
cd /home/pi/Amiga/dir/Work/WHDLoad_Games/

find . -type f -name 'igame.iff' | sed -r 's|/[^/]+$||' |sort |uniq > ~/G.txt
awk '{print $0"/"}' ~/G.txt > ~/Ga.txt
awk '{ print "\""$0"\""}' ~/Ga.txt > ~/Gamecp.txt


##
declare -a arr=( "NTSC" "PAL" )

for i in "${arr[@]}"
do
   Dest="~/Amiga/dir/Work/WHDLoad_Games/"$i

   echo "Creating New WHDLoad folder "$Dest" "
   grep "$i/" ~/Gamecp.txt > ~/tmp.txt
   grep "$i/" ~/Gamecp.txt
    
   awk -v var=$Dest '{print $0 " " var}' tmp.txt > tmp1.txt
   awk '$0="mv  "$0' ~/tmp1.txt > ~/"$i".sh
   chmod -R 777 "$i".sh
   ./"$i".sh
   sudo rm -rf ~/"$i".sh
  
done
# Cleanup garb slave
cd /home/pi/Amiga/dir/Work/WHDLoad_Games/
find "$(pwd)" -name *.slave > ~/G.txt
declare -a arr=( "Data" "data" "DATA"  )

for i in "${arr[@]}"
do

grep "/$i/" ~/G.txt
ls | grep "/$i/" ~/G.txt | xargs rm -v
sudo rm -rf ~/G.txt

done


# Split Games and Demos
 mv  ~/Amiga/dir/Work/WHDLoad_Games/Demos/* ~/Amiga/dir/Work/WHDLoad_Demos/OCS/  
 mv  ~/Amiga/dir/Work/WHDLoad_Games/Demo/* ~/Amiga/dir/Work/WHDLoad_Demos/OCS/ 
 sudo rm -rf  ~/Amiga/dir/Work/WHDLoad_Games/Demos/
 sudo rm -rf  ~/Amiga/dir/Work/WHDLoad_Games/Demo/
cd  ~/Amiga/dir/Work/WHDLoad_Demos/OCS/
find . -type d -name "*AGA*" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Demos/AGA/' {} \;
find . -name "*AGA*" -exec rm -r "{}" \;

fi
# Cleanup Games
if [ -d /home/pi/Amiga/dir/Work/WHDLoad_Games/ ]; then
   mv  ~/Amiga/dir/Work/WHDLoad_Games/Games/* ~/Amiga/dir/Work/WHDLoad_Games/OCS/
   #sudo rm -rf ~/Amiga/dir/Work/WHDLoad_Games/Games/
fi
# All the rest of files .. 
# Cleanup OCR
if [ -d /home/pi/Amiga/dir/Work/WHDLoad_Games/OCS/ ]; then
cd ~/Amiga/dir/Work/WHDLoad_Games/OCS/

#Language
find . -type d -name "*De" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/De/' {} \;
find . -name "*De" -exec rm -r "{}" \;
find . -type d -name "*Fr" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/Fr/' {} \;
find . -name "*Fr" -exec rm -r "{}" \;
find . -type d -name "*It" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/It/' {} \;
find . -name "*It" -exec rm -r "{}" \;
find . -type d -name "*Es" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/Es/' {} \;
find . -name "*Es" -exec rm -r "{}" \;
find . -type d -name "*Gr" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/Gr/' {} \;
find . -name "*Gr" -exec rm -r "{}" \;

# System
find . -type d -name "*NTSC*" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/NTSC/' {} \;
find . -name "*NTSC*" -exec rm -r "{}" \;
find . -type d -name "*AGA*" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/AGA/' {} \;
find . -name "*AGA*" -exec rm -r "{}" \;
find . -type d -name "*CD32*" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/CD32/' {} \;
find . -name "*CD32*" -exec rm -r "{}" \;
find . -type d -name "*CDTV*" -exec sh -c 'mv -- "$0" ~/Amiga/dir/Work/WHDLoad_Games/CDTV/' {} \;
find . -name "*CDTV*" -exec rm -r "{}" \;

fi



sudo rm -rf ~/G.txt
sudo rm -rf ~/Ga.txt
sudo rm -rf ~/tmp.txt
sudo rm -rf ~/tmp1.txt
sudo rm -rf ~/new.txt
sudo rm -rf ~/Gamecp.txt
sudo rm -rf ~/Game.txt

cp -R  ~/.config/new.txt ~/.config/skip.txt
#diff ~/Game.txt ~/Gamecp.txt > diff.txt
#find /home/pi/$src -type f -exec md5sum {} + | sort -k 2 > ~/src.txt
#find /home/pi/$dst -type f -exec md5sum {} + | sort -k 2 > ~/des.txt
#diff -u ~/src.txt ~/des.txt | sort -k 2 > ~/diff.txt

      toilet "KickPi-OS" --metal
      echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
  	  echo " "
      
      

