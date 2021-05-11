#!/bin/bash

sudo umount /dev/sda1
sudo umount /dev/sda2
sudo rm -rvf /home/pi/root /home/pi/boot
sudo rm -rvf /home/pi/Desktop/root /home/pi/Desktop/boot
sudo fdisk /dev/sda << EOF
 o
 p
 w
EOF
sudo umount root boot