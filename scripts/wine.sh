git clone https://github.com/ptitSeb/box64
cd box64
mkdir build; cd build; cmake .. -DSD845=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j4
sudo make install
sudo systemctl restart systemd-binfmt


#wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash
