# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

# Inherit from common msm8226
-include device/samsung/msm8226-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := s3ve3g,s3ve3gds,s3ve3gjv

DEVICE_PATH := device/samsung/s3ve3g

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Audio
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# Build
BLOCK_BASED_OTA := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/libmmcamera_imx175.so|libshim_imx175.so
    
# FM
AUDIO_FEATURE_ENABLED_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true
BOARD_HAVE_QCOM_FM := true  

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := libinit_s3ve3g
TARGET_UNIFIED_DEVICE := true

# NFC
# BOARD_HAVE_NFC := true
# include $(DEVICE_PATH)/nfc/pn547/board.mk

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37  androidboot.selinux=enforcing androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
TARGET_KERNEL_SOURCE := kernel/samsung/s3ve3g
TARGET_KERNEL_CONFIG := lineageos_s3ve3g_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 721420288
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12562627584
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Power HAL
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(DEVICE_PATH)/power/power_ext.c
TARGET_POWERHAL_VARIANT := qcom

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Radio
BOARD_PROVIDES_LIBRIL := true
TARGET_RIL_VARIANT := caf

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true 

# Wifi
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# inherit from the proprietary version
-include vendor/samsung/s3ve3g/BoardConfigVendor.mk
