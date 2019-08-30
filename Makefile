#
# This is a Makefile for OpenWrt.
# To build, pull the announce repository into the "package/" subdirectory in the OpenWrt SDK,
# then run "make V=s".
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cncstream
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS:= +libc

define Package/cncstream
  SUBMENU:=Utilities
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Stream GCode to GRBL
  URL:=https://github.com/probonopd/cncstream-for-openwrt
  DEPENDS:= +libc
endef

define Package/cncstream/description
  Stream GCode to GRBL.
  This can be useful for sending GCode to 3D printers and CNC machines.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Package/cncstream/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cncstream $(1)/usr/bin/
endef

$(eval $(call BuildPackage,cncstream))
