
FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h
if [[ $FREE -lt 67108 ]]; then               # 64G = 10*1024*1024k
    
    eche "Less than 64GB free!"
    
    
    else 
    df --output=avail -h "$PWD" | sed '1d;s/[^0-9]//g'
    sudo rsync -av --update /home/pi/pimiga15/ /home/pi/pimiga15/ --progress >> Pimiga_merge_log.txt
    
fi;



