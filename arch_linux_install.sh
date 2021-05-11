#!/bin/bash

sudo fdisk /dev/sda << EOF
 o
 p
 n
 p
 1
 
 +200M
 t
 c
 n
 p
 2
 
 
 w
EOF
sudo mkfs.vfat /dev/sda1 << EOF
 Y
EOF
sudo mkdir boot
sudo mount /dev/sda1 boot
sudo mkfs.ext4 /dev/sda2 << EOF
 Y
EOF
sudo mkdir root
sudo mount /dev/sda2 root
sudo bsdtar -xpf /home/pi/ArchLinuxARM-rpi-aarch64-latest.tar.gz -C root
sync
sudo mv root/boot/* boot
sudo sed -i 's/mmcblk0/mmcblk1/g' root/etc/fstab
sudo umount boot root
 