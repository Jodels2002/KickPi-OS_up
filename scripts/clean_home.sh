
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021 usr/share/images/desktop-base/desktop-grub.png
#*************************************************************************************************************
 
      clear
      toilet "KickPi-OS" --metal
      echo -e "$GREY KickPI-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 KickPi-OS "
      echo " No Rights Reserved.  "
      echo " "      
      echo " "
      df $PWD | awk '/[0-9]%/{print $(NF-2)" free space"}'
      echo "  ... delete unnecessary files  " 
      cd ~
      sudo find . -name "\._*" -type f -print0 | xargs -0 /bin/rm -f      
      echo "  ... delete Spotlight files  " 
      sudo find . -name "_UAEFSDB.*" -type f -print0 | xargs -0 /bin/rm -f
      sudo find . -name "*.mp4" -type f -print0 | xargs -0 /bin/rm -f
      echo "  ... delete mp4 files  " 
      sudo find . -name ".DS_Store" -type f -print0 | xargs -0 /bin/rm -f
      echo "  ... delete mpeg files  " 
      sudo find . -name "*.mpg" -type f -print0 | xargs -0 /bin/rm -f
      echo " "      
      echo " "
      echo "  ... delete unnecessary files finished:-)  " 
      df $PWD | awk '/[0-9]%/{print $(NF-2)" free space"}'

