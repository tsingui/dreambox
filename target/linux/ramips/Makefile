#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mipsel
BOARD:=ramips
BOARDNAME:=Ralink RT288x/RT305x
SUBTARGETS:=rt288x rt305x
CFLAGS:=-Os -pipe -mips32r2 -mtune=mips32r2 -funit-at-a-time
FEATURES:=squashfs

LINUX_VERSION:=2.6.32.59

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES+=\
	kmod-rt2x00-soc  \
	kmod-leds-gpio kmod-input-core kmod-input-polldev kmod-gpio-buttons \
	kmod-gpio-dev kmod-ledtrig-usbdev gpioctl kmod-button-hotplug wpad-mini maccalc 
define Target/Description
	Build firmware images for Ralink RT288x/RT305x based boards.
endef

$(eval $(call BuildTarget))
