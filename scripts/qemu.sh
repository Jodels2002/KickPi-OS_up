#!/bin/bash
# KickPi-OS
# B.Titze 2022
cd

sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-bin libvirt-clients bridge-utils 
sudo apt install -y virt-manager
sudo apt install -y qemu-system-ppc
sudo usermod -a -G libvirt pi
  
qemu-img create -f qcow2 sam460.img 2G
  
qemu-system-ppc -M sam460ex -m 2048 -rtc base=localtime \ 
-drive if=none,id=cd,file=Sam460InstallCD-53.58.iso,format=raw \
-device ide-cd,drive=cd,bus=ide.1 \
-drive if=none,id=hd,file=sam460.img,format=raw \
-device ide-hd,drive=hd,bus=ide.0 \ 
-boot order=c,menu=on \ 
-device rtl8139,netdev=mynet0 \ 
-netdev user,id=mynet0 \ 
-device es1370 \


