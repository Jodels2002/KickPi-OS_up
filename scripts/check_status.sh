md5sum /etc/wpa_supplicant/wpa_supplicant.conf | cut -c -32 > /home/pi/.backup/default.md5
md5sum /etc/wpa_supplicant/wpa_supplicant.conf | cut -c -32 > /home/pi/.backup/wpa.md5

default="/home/pi/.backup/default.md5"
act="/home/pi/.backup/wpa.md5"

#if ! cmp --silent "$default" "$act"; then

#echo " Is the same"
#else
#echo "WPA is set"

#fi


wget -q --spider http://google.com

 if [ $? -eq 0 ]; then


 cd
     
 
 else
    whiptail --msgbox " Welcome to KickPi-OS, 
    \n lets setup your system..." 10 40 1
    sudo -AE piwiz
    u
    
 
 fi
