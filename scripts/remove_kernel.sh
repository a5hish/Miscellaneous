#!/bin/bash

############################################
#
# Author	: ashish
# Date 		: 5-10-2018 
# Version 	: v0.1
# Description 	: Removes the specified kernel-version image from the system.
#
############################################


KERNEL_VERSION=$1

# check if kernel version specified as argument.
if [[ $KERNEL_VERSION == "" ]]; then
	echo "[ERROR] : No kernel version specified"
	echo "[USAGE] : $0 <kernel_version>"
	exit
fi

# prompt confirmation 
echo "Selected kernel to remove : $KERNEL_VERSION*"
read -p " Are you sure you want to remove [y/n] :" op

if [[ $op != "y" ]]; then
	echo "Closing."
	exit
fi
	
# remove all kernel-images and modules of specified version
echo "[Removing kernel-image and modules ...]"

rm -rvf /boot/vmlinuz*$KERNEL_VERSION*
rm -rvf /boot/initrd*$KERNEL_VERSION*
rm -rvf /boot/System-map*$KERNEL_VERSION*
rm -rvf /boot/config-*$KERNEL_VERSION*
rm -rvf /lib/modules/*$KERNEL_VERSION*/
rm -rvf /var/lib/initramfs-tools/*$KERNEL_VERSION*/


# updating grub.
echo "[Updating grub...]"
update-grub2

echo "[kernel $KERNEL_VERSION* removed successfully]"
