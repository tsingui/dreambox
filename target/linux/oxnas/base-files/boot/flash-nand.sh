#!/bin/sh

#
# This script is use for upgrade or recovery nand bootloader.
#  lintel<lintel.huang@gmail.com>
#
ERROR=1
NAND=/dev/mtd8
STAGE1=stage1.wrapped
UBIFS=rootfs.ubi
UBOOT=u-boot.wrapped
KERNEL=uImage
BS=512
FLASH_ERASE=/usr/sbin/flash_eraseall

if [ ! -x /usr/sbin/flash_eraseall ] && [ ! -x /sbin/nandbd_upgrade ]
then
    echo "FlashTools has problem!" 
    exit ${ERROR}
fi;

if [ ! -e $STAGE1 ] && [ ! -e $UBOOT ]
then
    echo "Upgrade files not found!!" 
    exit ${ERROR}
else
    /usr/sbin/flash_eraseall $NAND
    /sbin/nandbd_upgrade -s stage1.wrapped -u u-boot.wrapped $NAND
fi;

if [ -e $KERNEL ]
then
    /sbin/nandbd_upgrade -k $KERNEL $NAND
fi;

if [ -e $UBIFS ]
then

mtd erase rootfs

ubidetach -p /dev/mtd6
sleep 1
ubiformat /dev/mtd6 -y -f $UBIFS
sleep 1
ubiattach /dev/ubi_ctrl -m 6
sleep 1
mount -t ubifs ubi0:rootfs /mnt
chown -R root /mnt/*
sleep 1
umount /mnt
ubidetach -p /dev/mtd6
fi;

echo "OpenWrt Upgrade Done."