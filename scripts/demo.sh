#!/bin/bash
# rricharz 2019

cd /home/pi/Tek4010/


for filename in ardsfiles/*.pic
do
    # erase screen
    printf '\033\014'
    echo Displaying "$filename" 
   ./tek4010  -full -wait 3 -b100000 -ARDS cat  "$filename"
    
    
    
done



for filename in pltfiles/*.plt
do
    # erase screen
    printf '\033\014'
    echo Displaying "$filename" 
   ./tek4010  -full -wait 3 -b100000  cat  "$filename"
    
    
    
done



