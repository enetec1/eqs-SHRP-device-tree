#
# Copyright 2017 The Android Open Source Project
# Copyright 2023 by EneTec        
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Inherit from common
-include $(DEVICE_PATH)/BoardConfigSHRP.mk

# Extras
BOARD_ROOT_EXTRA_FOLDERS := batinfo
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
#TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Recovery
TARGET_OTA_ASSERT_DEVICE := eqs

# Encryption/decryption
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2

# SDK
BOARD_SYSTEMSDK_VERSIONS := 31

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_eqs
TARGET_RECOVERY_DEVICE_MODULES := libinit_eqs

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Platform - Bootloader
TARGET_BOARD_PLATFORM := taro
TARGET_BOOTLOADER_BOARD_NAME := taro
QCOM_BOARD_PLATFORMS += taro
TARGET_NO_BOOTLOADER := false
TARGET_USES_UEFI := true
TARGET_USES_REMOTEPROC := true

# Kernel/Ramdisk
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_RAMDISK_USE_LZ4 := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

# Partitions Info
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USES_METADATA_PARTITION := true

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_KERNEL-GKI_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x06000000
# BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x02000000
# BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
# BOARD_METADATAIMAGE_PARTITION_SIZE := 0x01000000
# BOARD_DTBOIMG_PARTITION_SIZE := 0x01800000

# Dynamic/Logical Partitions
BOARD_SUPER_PARTITION_SIZE := 0x220000000
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Recovery partition
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x06400000

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying out files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_NINJA_USES_ENV_VARS += RTIC_MPGEN SDCLANG_AE_CONFIG SDCLANG_CONFIG SDCLANG_SA_ENABLE
BUILD_BROKEN_USES_BUILD_HOST_SHARED_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# Recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    libxml2 \
    vendor.display.config@1.0 \
    vendor.display.config@2.0
	
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so
	
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Verified boot - AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2
    
# Hack: prevent anti rollback
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# TWRP specific build flags
TW_Y_OFFSET := 5
TW_H_OFFSET := -25
TW_CUSTOM_BATTERY_POS := right
TW_CUSTOM_CPU_POS := left
TW_STATUS_ICONS_ALIGN := center
TW_NO_HAPTICS := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_THEME := portrait_hdpi
TW_BACKUP_EXCLUSIONS := /data/fonts/files
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone39/temp"
TW_BRIGHTNESS_PATH := "/sys/devices/platform/soc/ae00000.qcom\x2cmdss_mdp/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1792
TW_FRAMERATE := 60
TW_QCOM_ATS_OFFSET := 1666528204500
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.date.utc;ro.bootimage.build.date.utc=ro.build.date.utc;ro.odm.build.date.utc=ro.build.date.utc;ro.product.build.date.utc=ro.build.date.utc;ro.system.build.date.utc=ro.build.date.utc;ro.system_ext.build.date.utc=ro.build.date.utc;ro.vendor.build.date.utc=ro.build.date.utc;ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"

TW_LOAD_VENDOR_MODULES := "qpnp_adaptive_charge.ko mmi_annotate.ko mmi_info.ko mmi_sys_temp.ko mmi_charger.ko moto_f_usbnet.ko sensors_class.ko touchscreen_mmi.ko stmicro_mmi.ko goodix_brl_mmi.ko qpnp-pbs.ko qcom-hv-haptics.ko utags.ko"

# TWRP Debug Flags
#TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace
#TARGET_RECOVERY_DEVICE_MODULES += twrpdec
#RECOVERY_BINARY_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/twrpdec

# For local builds only
#
# Custom TWRP Versioning
ifneq ($(wildcard device/common/version-info/.),)
    # device version is optional - the default value is "0" if nothing is set in device tree
    CUSTOM_TWRP_DEVICE_VERSION := 0
endif
#
# end local build flags

