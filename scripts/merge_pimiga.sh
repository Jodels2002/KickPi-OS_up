
find /home/pi/pimiga2/ -type f -exec md5sum {} + | sort -k 2 > pimiga2.txt
find /home/pi/pimiga15/ -type f -exec md5sum {} + | sort -k 2 > pimiga15.txt
diff -u pimiga2.txt pimiga15.txt | sort -k 2 > diff.txt


FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h
if [[ $FREE -lt 33554432 ]]; then               # 32G = 10*1024*1024k
    
    echo "Less than 32GB free!"
    
    
    else 
    #df --output=avail -h "$PWD" | sed '1d;s/[^0-9]//g'
    #sudo rsync -av --ignore-existing /home/pi/pimiga15/ /home/pi/pimiga2/ 
    # sudo rsync -av --ignore-existing /home/pi/pimiga15/ /home/pi/pimiga2/ --progress >> Pimiga_merge_log.txt
    echo "More than 32GB free!"
fi;
