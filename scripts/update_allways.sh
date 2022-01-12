if [ -d /OLED/ ]; then
update.sh
fi

sudo dpkg --configure -a
sudo apt -y --fix-broken install
sudo apt -f -y install
