# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

AICP_BRANCH=p

# AICP RELEASE VERSION
AICP_VERSION_MAJOR = 14
AICP_VERSION_MINOR = 0
AICP_VERSION_MAINTENANCE =0

VERSION := $(AICP_VERSION_MAJOR).$(AICP_VERSION_MINOR)$(AICP_VERSION_MAINTENANCE)

ifndef AICP_BUILDTYPE
    ifdef RELEASE_TYPE
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^AICP_||g')
        AICP_BUILDTYPE := $(RELEASE_TYPE)
    else
        AICP_BUILDTYPE := UNOFFICIAL
    endif
endif

ifdef AICP_BUILDTYPE
    ifeq ($(AICP_BUILDTYPE), RELEASE)
       AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-RELEASE-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), NIGHTLY)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-NIGHTLY-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), EXPERIMENTAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-EXPERIMENTAL-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), UNOFFICIAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
    endif
else
#We reset back to UNOFFICIAL
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
endif
