
md5sum /etc/wpa_supplicant/wpa_supplicant.conf | cut -c -32 > /home/pi/.backup/wpa.md5

default="/opt/KickPi-OS/config//default.md5"
act="/home/pi/.backup/wpa.md5"

if ! cmp --silent "$default" "$act"; then

echo "WPA is set"
else
echo "WPA is default"

whiptail --msgbox " Welcome to KickPi-OS V2, 
    \n 
    \n now lets setup your: 
    \n 
    \n - Password for Pi User
    \n - Wifi
    \n - Language" 10 35 1
    sudo -AE piwiz
    u

fi
