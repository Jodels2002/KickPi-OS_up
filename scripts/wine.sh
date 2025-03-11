sudo apt -y install wine
sudo dpkg --add-architecture i386 

wget -nc https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/i386/libfaudio0_20.01-0~buster_i386.deb
sudo apt install ./libfaudio0_20.01-0~buster_i386.deb

wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key


sudo apt-get install -y software-properties-common

sudo apt-add-repository 'deb http://dl.winehq.org/wine-builds/debian/ buster main'
sudo apt update
sudo apt upgrade


sudo apt install -y --install-recommends wine

wine msiexec /i ~/Desktop/A      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine
 
      
      cd
      #wget -nc https://download.abime.net/winuae/releases/InstallWinUAE4400.msi
      wget -nc https://download.abime.net/winuae/releases/InstallWinUAE5100.msi
      #wine msiexec /i ~/Desktop/AmigaForever.msi
      #wine msiexec /i wine msiexec /i InstallWinUAE4400.msi
      wine msiexec /i wine msiexec /i InstallWinUAE5100.msi
