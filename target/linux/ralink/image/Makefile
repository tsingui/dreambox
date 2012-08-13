#
# Copyright (C) 20012 DreamBox
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk


define Image/BuildKernel
	$(STAGING_DIR_HOST)/bin/lzma e $(KDIR)/vmlinux -lc1 -lp2 -pb2 $(KDIR)/vmlinux.lzma
	mkimage -A mips -O linux -T kernel -a 80000000 -C lzma -e \
		0x80000000 \
		-n 'MIPS DreamBox Linux-$(LINUX_VERSION)' \
		-d $(KDIR)/vmlinux.lzma $(KDIR)/uImage.lzma
endef

define Image/Build/squashfs
	# Align and append a JFFS marker
	$(call prepare_generic_squashfs,$(KDIR)/root.$(1))
endef

define Image/Build
	$(call Image/Build/$(1),$(1))
	( \
		dd if=$(KDIR)/uImage.lzma bs=1024k conv=sync; \
		dd if=$(KDIR)/root.$(1) bs=65536 conv=sync; \
	) > $(BIN_DIR)/openwrt-$(BOARD)-$(1).img
endef

$(eval $(call BuildImage))
