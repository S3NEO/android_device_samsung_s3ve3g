# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

# inherit from common s3ve3g
-include device/samsung/s3ve3g-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := s3ve3g,s3ve3gds,s3ve3gjv

# Kernel
TARGET_KERNEL_CONFIG := lineageos_s3ve3g_defconfig

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8226
TARGET_LIBINIT_MSM8226_DEFINES_FILE := device/samsung/s3ve3g/init/init_s3ve3g.cpp

# Radio/RIL
include $(COMMON_PATH)/radio/single/board.mk

# inherit from the proprietary version
-include vendor/samsung/s3ve3g/BoardConfigVendor.mk
