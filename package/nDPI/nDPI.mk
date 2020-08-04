################################################################################
#
# joe
#
################################################################################

NDPI_VERSION = a50169a7b3ec36c8d789191b014715126e820698
NDPI_SITE = $(call github,ntop,nDPI,$(NDPI_VERSION))
NDPI_LICENSE = LGPL-3.0
NDPI_LICENSE_FILES = COPYING

define NDPI_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
NDPI_PRE_CONFIGURE_HOOKS += NDPI_RUN_AUTOGEN
NDPI_DEPENDENCIES += libpcap
NDPI_CONF_ENV += ac_cv_lib_pcap_pcap_open_live=yes

$(eval $(autotools-package))
