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

DEVICE_PATH := device/samsung/s3ve3g

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

TARGET_OTA_ASSERT_DEVICE := s3ve3g,s3ve3gds,s3ve3gjv

# Audio
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
TARGET_HAS_SONY_CAMERA := true
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/libmmcamera_imx175.so|libimx175_shim.so
    
# FM
AUDIO_FEATURE_ENABLED_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true
BOARD_HAVE_QCOM_FM := true    

# Radio
SIM_COUNT := 1
#TARGET_GLOBAL_CFLAGS += -DANDROID_MULTI_SIM
#TARGET_GLOBAL_CPPFLAGS += -DANDROID_MULTI_SIM

# Init
TARGET_INIT_VENDOR_LIB := libinit_s3ve3g
TARGET_UNIFIED_DEVICE := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom msm_rtb.filter=0x37  androidboot.selinux=permissive androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
TARGET_KERNEL_SOURCE := kernel/samsung/s3ve3g
TARGET_KERNEL_CONFIG := lineageos_s3ve3g_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage

# NFC
include device/samsung/s3ve3g/nfc/pn547/board.mk

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 721420288
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12562627584
TARGET_USERIMAGES_USE_F2FS := true

# Power HAL
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/s3ve3g/power/power_ext.c
TARGET_POWERHAL_VARIANT := qcom

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Build
BLOCK_BASED_OTA := true
