
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021 usr/share/images/desktop-base/desktop-grub.png
#*************************************************************************************************************
      sudo chmod -R 777 /home/$USER/Amiga
      echo " "
      echo "  ... delete unnecessary files  " 
      cd ~
      sudo find . -name "\._*" -type f -print0 | xargs -0 /bin/rm -f
      sudo find . -name "_UAEFSDB.*" -type f -print0 | xargs -0 /bin/rm -f
      sudo find . -name "*.mp4" -type f -print0 | xargs -0 /bin/rm -f
      echo "  ... delete mp4 files  " 
      sudo find . -name ".DS_Store" -type f -print0 | xargs -0 /bin/rm -f
      echo "  ... delete mpeg files  " 
      sudo find . -name "*.mpg" -type f -print0 | xargs -0 /bin/rm -f

