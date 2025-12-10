#
# Copyright (C) The Android Open Source Project
# Copyright (C) The LineageOS Project
# Copyright (C) Yet Another AOSP Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DIR := device/google/pantah-kernels/6.1/
TARGET_BOARD_KERNEL_HEADERS := device/google/pantah-kernels/6.1/kernel-headers
TARGET_PREBUILT_KERNEL := device/google/pantah-kernels/6.1/Image.lz4

DEVICE_PACKAGE_OVERLAYS += device/google/pantah/panther/overlay

include device/google/pantah/configs/audio/panther/audio-tables.mk
include device/google/gs201/device-shipping-common.mk
include device/google/gs-common/bcmbt/bluetooth.mk
include device/google/gs-common/touch/focaltech/focaltech.mk

# Init files
PRODUCT_COPY_FILES += \
	device/google/pantah/init/init.pantah.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.pantah.rc \
	device/google/pantah/init/init.panther.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.panther.rc

# Recovery files
PRODUCT_COPY_FILES += \
        device/google/pantah/init/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.panther.rc

# MIPI Coex Configs
PRODUCT_COPY_FILES += \
    device/google/pantah/panther/radio/panther_display_primary_mipi_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/display_primary_mipi_coex_table.csv \
    device/google/pantah/panther/radio/panther_camera_front_mipi_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/camera_front_mipi_coex_table.csv \
    device/google/pantah/panther/radio/panther_camera_rear_wide_mipi_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/camera_rear_wide_mipi_coex_table.csv \
    device/google/pantah/panther/radio/panther_camera_front_dbr_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/camera_front_dbr_coex_table.csv

# Camera
PRODUCT_COPY_FILES += \
	device/google/pantah/configs/media/media_profiles_panther.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Display Config
PRODUCT_COPY_FILES += \
        device/google/pantah/panther/display_colordata_dev_cal0.pb:$(TARGET_COPY_OUT_VENDOR)/etc/display_colordata_dev_cal0.pb \
        device/google/pantah/panther/display_golden_sdc-s6e3fc3-p10_cal0.pb:$(TARGET_COPY_OUT_VENDOR)/etc/display_golden_sdc-s6e3fc3-p10_cal0.pb

# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
	device/google/pantah/configs/nfc/libnfc-hal-st-proto1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st-proto1.conf \
	device/google/pantah/configs/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
    	device/google/pantah/configs/nfc/libnfc-nci-panther.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

PRODUCT_PACKAGES += \
	android.hardware.nfc-service.st \
	NfcOverlayPanther

# Shared Modem Platform
include device/google/gs-common/modem/modem_svc_sit/shared_modem_platform.mk

# SecureElement
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.2-service-gto \
	android.hardware.secure_element@1.2-service-gto-ese2

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
	frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
	device/google/pantah/configs/nfc/libse-gto-hal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal.conf \
	device/google/pantah/configs/nfc/libse-gto-hal2.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal2.conf

DEVICE_MANIFEST_FILE += \
	device/google/pantah/configs/nfc/manifest_se.xml

# Thermal Config
PRODUCT_COPY_FILES += \
	device/google/pantah/configs/thermal/thermal_info_config_panther.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json \
	device/google/pantah/configs/thermal/thermal_info_config_charge_panther.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config_charge.json \
	device/google/pantah/configs/thermal/thermal_info_config_proto.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config_proto.json

# Power HAL config
PRODUCT_COPY_FILES += \
	device/google/pantah/configs/power/powerhint-panther.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json
PRODUCT_COPY_FILES += \
	device/google/pantah/configs/power/powerhint-panther-a0.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint-a0.json

# Bluetooth HAL
PRODUCT_COPY_FILES += \
	device/google/pantah/configs/bluetooth/bt_vendor_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor_overlay.conf

# Enable Bluetooth AutoOn feature
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.server.automatic_turn_on=true

# Bluetooth Tx power caps
PRODUCT_COPY_FILES += \
    device/google/pantah/configs/bluetooth/bluetooth_power_limits_panther.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits.csv \
    device/google/pantah/configs/bluetooth/bluetooth_power_limits_panther_G03Z5_JP.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G03Z5_JP.csv \
    device/google/pantah/configs/bluetooth/bluetooth_power_limits_panther_GVU6C_CA.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_GVU6C_CA.csv \
    device/google/pantah/configs/bluetooth/bluetooth_power_limits_panther_GQML3_EU.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_GQML3_EU.csv \
    device/google/pantah/configs/bluetooth/bluetooth_power_limits_panther_GVU6C_EU.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_GVU6C_EU.csv \
    device/google/pantah/configs/bluetooth/bluetooth_power_limits_panther_GQML3_US.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_GQML3_US.csv \
    device/google/pantah/configs/bluetooth/bluetooth_power_limits_panther_GVU6C_US.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_GVU6C_US.csv

# LE Auido Offload Capabilities setting
PRODUCT_COPY_FILES += \
    device/google/pantah/configs/bluetooth/le_audio_codec_capabilities.xml:$(TARGET_COPY_OUT_VENDOR)/etc/le_audio_codec_capabilities.xml

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += \
    device/google/pantah/configs/powerstats/panther \
    device/google/pantah

# WiFi Overlay
PRODUCT_PACKAGES += \
    WifiOverlay2022_P10

# Location
PRODUCT_COPY_FILES += \
    device/google/pantah/configs/location/lhd_user.conf.p10:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/lhd.conf \
    device/google/pantah/configs/location/scd_user.conf.p10:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/scd.conf
ifneq (,$(filter 6.1, $(TARGET_LINUX_KERNEL_VERSION)))
    PRODUCT_COPY_FILES += \
        device/google/pantah/configs/location/gps_user.6.1.xml.p10:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/gps.xml
else
    PRODUCT_COPY_FILES += \
        device/google/pantah/configs/location/gps_user.xml.p10:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/gps.xml
endif

# CutoutOverlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayG03Z5 \
    SettingsOverlayGQML3 \
    SettingsOverlayGVU6C \
    SettingsOverlayGVU6C_VN \
    SettingsOverlayPanther

# Device features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop
