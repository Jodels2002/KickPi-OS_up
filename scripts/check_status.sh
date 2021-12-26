wget -q --spider http://google.com

 if [ $? -eq 0 ]; then



      sudo rm -rf /home/$USER/KickPi-OS/


      cd
      git clone --depth=1 https://github.com/Jodels2002/KickPi-OS_up.git
      sudo mv /home/$USER/KickPi-OS_up /home/$USER/KickPi-OS  
      sudo chmod -R 777 KickPi-OS
      
      
      sudo cp -f -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo rm -rf /opt/KickPi-OS
      sudo cp -f -R /home/$USER/KickPi-OS/ /opt
      
      sudo chmod -R 777 /usr/local/bin
      sudo chmod -R 777 /opt/KickPi-OS
      sudo chmod -R 777 /home/pi/Desktop/
      /home/$USER/KickPi-OS/scripts/pikickme.sh
 
 else
    whiptail --msgbox " Sorry, you must first connect to internet ..." 20 50 1
    sudo -AE piwiz
    u
    
 
 fi
