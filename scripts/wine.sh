git clone https://github.com/ptitSeb/box64
cd box64
mkdir build; cd build; cmake .. -DSD845=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j4
sudo make install
sudo systemctl restart systemd-binfmt


#wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

diff -rq /home/pi/pimiga15/ /home/pi/pimiga2/ >unterschiede.txt 2>&1


FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h
if [[ $FREE -lt 67108 ]]; then               # 64G = 10*1024*1024k
    
    eche "Less than 64GB free!"
    
    
    else 
    df --output=avail -h "$PWD" | sed '1d;s/[^0-9]//g'
fi;
