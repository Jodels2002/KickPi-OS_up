clear
sudo chmod -R 777 /etc/emulationstation/
echo "Clean up Emulationstation" 
sudo chmod -R 777 /home/pi/RetroPie/
echo "Clean up Retropie" 
sudo rm -d  /home/pi/RetroPie-Setup/
sudo chmod -R 777 /opt/retropie/
 
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
     sudo chmod -R 777 /home/$USER/RetroPie-Setup/
     cd /home/$USER/RetroPie-Setup/ 
     
       sudo cp -rf /opt/KickPi-OS/Retropie/es_settings.cfg /opt/retropie/configs/all/emulationstation/
      	sudo cp -rf /opt/KickPi-OS/Retropie/es_systems.cfg /etc/emulationstation/

sudo git clone --recursive --depth 1 --branch master "https://github.com/RetroHursty69/es-theme-magazinemadness.git" "/etc/emulationstation/themes/magazinemadness"
clear
toilet "KickPi-OS" --metal
cd /home/$USER/RetroPie-Setup/
sudo ./retropie_setup.sh
p
