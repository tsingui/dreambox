#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mipsel
BOARD:=ralink
BOARDNAME:=Ralink SoC
FEATURES:=squashfs
LINUX_VERSION:=2.6.21.7
CFLAGS:=-Os -pipe -mips32r2 -mtune=mips32r2 -funit-at-a-time
include $(INCLUDE_DIR)/target.mk

# Default packages common to all targets (even though this list is
# duplicated between all targets, it should be kept identical).
DEFAULT_PACKAGES = \
	base-files 

# These are used during production in the Edimax factory
DEFAULT_PACKAGES += kmod-usb-net \
	            kmod-usb-net-asix

# 2.0n specific ralink kernel drivers, a switch configuration userspace
# utility and the wireless-tools (since ra_wifi doesn't strictly depend
# on it, but we need it).
DEFAULT_PACKAGES += ra_wifi \
		    raswitch \
		    ap_client \
		    wireless-tools
define Target/Description
	Build firmware images for Ralink Soc Boards
endef

$(eval $(call BuildTarget))
