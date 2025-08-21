#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/yaap/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := panther
DEVICE_PATH := device/google/pantah
VENDOR_PATH := vendor/google/panther

# Inherit a few makefiles
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/gs201/yaap_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-yaap.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7
PRODUCT_NAME := yaap_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# YAAP Flags
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_ENABLE_BLUR := true

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="panther-user 16 BP2A.250805.005 13691446 release-keys" \
    BuildFingerprint=google/panther/panther:16/BP2A.250805.005/13691446:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
