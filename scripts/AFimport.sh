git clone https://github.com/ptitSeb/box64
cd box64
mkdir build; cd build; cmake .. -DSD845=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j4
sudo make install



if [ -f /home/pi/Desktop/AmigaForever9Plus.msi ]; then

sudo apt install -y msitools
cd /home/pi/Templates/
msiextract /home/pi/Desktop/AmigaForever9Plus.msi

cp -r -f "/home/pi/Templates/Program Files/Cloanto/Amiga Forever/Shared/"* /home/pi/Amiga/
mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
rm -d /home/pi/Amiga/rom/

 cd
sudo chmod -R 777 Amiga

if [ ! -d /home/pi/Amiga/Install/WB ]; then
      sudo python3 -m pip install -U pip
      sudo python3 -m pip install -U setuptools
      sudo pip install amitools  
      
      cd /home/pi/Amiga/adf/
      mkdir /home/pi/Amiga/dir/Work
      mkdir /home/pi/Amiga/dir/WB
      mkdir /home/pi/Amiga/Install/WB
      mkdir /home/pi/Amiga/Install/
      

      xdftool amiga-os-310-workbench.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Workbench3.1/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-extras.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Extras3.1/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-fonts.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Fonts/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-locale.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Locale/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-storage.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Storage3.1/* /home/pi/Amiga/dir/WB/
      xdftool amiga-os-310-install.adf unpack /home/pi/Amiga/Install/WB
      cp -r -f /home/pi/Amiga/Install/WB/Install3.1/* /home/pi/Amiga/dir/WB/
     fi 
      
               
      
