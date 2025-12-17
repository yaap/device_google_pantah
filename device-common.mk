#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-FileCopyrightText: 2025 Yet Another AOSP Project
# SPDX-FileCopyrightText: 2025 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel tree
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DIR := device/google/pantah-kernels/6.1/
TARGET_BOARD_KERNEL_HEADERS := device/google/pantah-kernels/6.1/kernel-headers
TARGET_PREBUILT_KERNEL := device/google/pantah-kernels/6.1/Image.lz4

include device/google/gs201/device-shipping-common.mk

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-yaap

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.prebuilt.xml \
    android.hardware.bluetooth_le.prebuilt.xml

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot-service.default-pixel \
    android.hardware.boot-service.default_recovery-pixel

PRODUCT_SOONG_NAMESPACES += device/google/pantah/bootctrl/aidl

# CutoutOverlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

# Device features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay

# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \

PRODUCT_PACKAGES += \
	android.hardware.nfc-service.st

# SecureElement
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.2-service-gto \
	android.hardware.secure_element@1.2-service-gto-ese2

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
	frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml

# PowerShare
include hardware/google/pixel/powershare/device.mk

### Build necessary packages for vendor

# Dumpstate
PRODUCT_PACKAGES += \
    dump_gsc.sh

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.sensors-V2-ndk.vendor:64

# Graphics
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# Scudo
PRODUCT_USE_SCUDO := true

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal

# OpenDelta
ifeq ($(TARGET_BUILD_GAPPS),true)
    PRODUCT_PACKAGES += pantahOpenDeltaOverlay
else
    PRODUCT_PACKAGES += pantahOpenDeltaOverlayVanilla
endif

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml
