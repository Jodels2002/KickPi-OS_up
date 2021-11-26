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

       sudo rm -rf /home/$USER/.bashrc
       cp -rf /opt/KickPi-OS/scripts/.bashrc /home/$USER/.bashrc
       sudo chmod -R 777 /home/$USER/.bashrc
       sudo cp  /opt/KickPi-OS/config/rc.local /etc/
sudo reboot now
