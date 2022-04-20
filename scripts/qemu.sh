#!/bin/bash
# KickPi-OS
# B.Titze 2022
cd

#sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils 
#sudo apt install -y virt-manager
sudo apt install -y qemu-system-ppc


qemu-system-ppc -machine sam460ex -rtc base=localtime \
  -drive if=none,id=cd,file=Sam460InstallCD-53.58.iso,format=raw \
  -device ide-cd,drive=cd,bus=ide.1
