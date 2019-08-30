#
# This is a Makefile for OpenWrt.
# To build, pull the announce repository into the "package/" subdirectory in the OpenWrt SDK,
# then run "make V=s".
#

include $(TOPDIR)/rules.mk

PKG_NAME:=srss
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS:= +libc

define Package/srss
  SUBMENU:=Utilities
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Calculate sunrise and sunset times 
  URL:=https://github.com/probonopd/srss-for-openwrt
  DEPENDS:= +libc
endef

define Package/srss/description
  Calculate sunrise and sunset times.
  This can be useful for scripting home automation applications, such as lighting.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Package/srss/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/srss $(1)/usr/bin/
endef

$(eval $(call BuildPackage,srss))
