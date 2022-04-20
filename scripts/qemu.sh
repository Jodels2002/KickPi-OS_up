#!/bin/bash
# KickPi-OS
# B.Titze 2022
cd

sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-bin libvirt-clients bridge-utils 
sudo apt install -y virt-manager
sudo apt install -y qemu-system-ppc
sudo adduser pi libvirtd
sudo usermod -a -G libvirt pi

# http://zero.eik.bme.hu/~balaton/qemu/amiga/
qemu-system-ppc -machine sam460ex -rtc base=localtime \
  -drive if=none,id=cd,file=Sam460InstallCD-53.58.iso,format=raw \
  -device ide-cd,drive=cd,bus=ide.1 \
  -vga cirrus
  
  qemu-system-ppc -machine sam460ex -rtc base=localtime \
  -drive if=none,id=cd,file=morphos-3.16.iso,format=raw \
  -device ati-vga,guest_hwcursor=true,romfile="" \
  -device ide-cd,drive=cd,bus=ide.1
  
  qemu-system-i386 -m 1G -drive if=ide,index=0,media=disk,file=ReactOS.qcow2 -drive if=ide,index=2,media=cdrom,file=ReactOS.iso -boot order=d -localtime -serial file:ReactOS.log
virt-install --name ReactOS --description "ReactOS VM" --memory 2048 --cdrom ~/ReactOS.iso --boot bootmenu.enable=on,bios.useserial=on --os-variant win2k --disk path=~/vm/ReactOS.qcow2,size=4,format=qcow2,device=disk --graphics spice,port=5909,listen=0.0.0.0,password=rosvm --virt-type=kvm --serial pty --video qxl --xml 'xpath.delete=./devices/graphics' --xml './devices/graphics/@defaultMode=insecure' --xml './devices/graphics/@autoport=no' --xml './devices/graphics/@type=spice' --xml "./devices/graphics/@port=20001"
