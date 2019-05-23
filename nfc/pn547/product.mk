#
# Copyright (C) 2018 The LineageOS Project
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

# NFC
$(call inherit-product, device/samsung/s3ve3g/nfc/product.mk)

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    libpn547_fw \
    libpn547_fw_pku \
    libpn547_fw_platform \
    nfc_nci.msm8226

PRODUCT_COPY_FILES += \
    device/samsung/s3ve3g/nfc/pn547/libnfc-brcm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-brcm.conf \
    device/samsung/s3ve3g/nfc/pn547/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf
