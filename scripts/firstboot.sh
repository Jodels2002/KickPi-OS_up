#!/bin/bash
# Install KickPi-OS
# B.Titze 2021
# KickPi-OS updater

LED

sudo rm -rf ~/KickPi-OS
LED_off
sudo dpkg --configure -a
sudo apt -y --fix-broken install
sudo apt -f -y install
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_expand_rootfs

wget -q --spider http://google.com

 if [ $? -eq 0 ]; then



sudo rm -rf /home/$USER/KickPi-OS/


      cd
      git clone --depth=1 https://github.com/Jodels2002/KickPi-OS_up.git
      sudo mv /home/$USER/KickPi-OS_up /home/$USER/KickPi-OS  
      sudo chmod -R 777 KickPi-OS
      
      
      sudo cp -f -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo cp -f -R /home/$USER/KickPi-OS/ /opt
      
      sudo chmod -R 777 /usr/local/bin
      sudo chmod -R 777 /opt/KickPi-OS
      sudo chmod -R 777 /home/pi/Desktop/
      /home/$USER/KickPi-OS/scripts/pikickme.sh
 else
    whiptail --msgbox " Sorry, you must first connect to internet :-)" 20 50 1
 fi
       sudo rm -rf /home/$USER/.bashrc
       cp -rf /opt/KickPi-OS/scripts/.bashrc /home/$USER/.bashrc
       sudo chmod -R 777 /home/$USER/.bashrc
       sudo cp  /opt/KickPi-OS/config/rc.local /etc/
sudo reboot now
