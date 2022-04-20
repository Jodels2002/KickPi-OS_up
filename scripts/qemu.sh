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
