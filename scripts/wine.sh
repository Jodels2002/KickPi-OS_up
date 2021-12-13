#Box86
git clone https://github.com/ptitSeb/box86
sudo dpkg --add-architecture armhf
cd ~/box86
mkdir build
cd build
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j$(nproc)
sudo make install
sudo systemctl restart systemd-binfmt

#Box64
git clone https://github.com/ptitSeb/box64
cd box64
mkdir build; cd build; cmake .. -DSD845=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j4
sudo make install
sudo systemctl restart systemd-binfmt

msiextract /home/pi/Desktop/AmigaForever9Plus.msi

#wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

#diff -rq /home/pi/pimiga15/ /home/pi/pimiga2/ >unterschiede.txt 2>&1

