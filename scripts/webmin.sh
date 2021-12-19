
if [ -d /etc/webmin/ ]; then

printf "Are you sure you want to uninstall Webmin? (y/n) : "
read answer
printf "\n"
if [ "$answer" = "y" ]; then
	echo "Removing Webmin package .."
	dpkg --remove webmin
  sudo rm /var/webmin -R
  sudo rm /usr/local/webmin -R
  cd
  clear
  toilet "KickPi-OS" --metal
  echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
  echo " Version V2.0 2020-2021 KickPi-OS "
  echo " No Rights Reserved.  "
  echo -e "$BLACK "
	echo "Done!"

else
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.930_all.deb
sudo dpkg -i webmin_1.930_all.deb
sudo apt -f -y install

cd
  clear
  toilet "KickPi-OS" --metal
  echo -e "$BLUE KickPI-OS ROM Operating System and Libraries" 
  echo " Version V2.0 2020-2021 KickPi-OS "
  echo " No Rights Reserved.  "
  echo -e "$BLACK "
	echo "Done! Webadmin installed"
  echo "https//localhost:10000/"
  chromium-browser https//localhost:10000/



fi
