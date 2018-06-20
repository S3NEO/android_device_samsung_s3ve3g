/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include <stdio.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <stdlib.h>
#include <android-base/properties.h>
#include "vendor_init.h"
#include "property_service.h"

using android::base::GetProperty;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void init_variant_properties() {

	std::string bootloader = GetProperty("ro.bootloader", "");
	
	if (bootloader.find("I9301I")==0) {
        /* s3ve3g */
        property_override("ro.vendor.build.fingerprint", "samsung/s3ve3gxx/s3ve3g:4.4.2/KOT49H/I9301IXXUANL1:user/release-keys");
        property_override("ro.build.fingerprint", "samsung/s3ve3gxx/s3ve3g:4.4.2/KOT49H/I9301IXXUANL1:user/release-keys");
        property_override("ro.build.description", "s3ve3gxx-user 4.4.2 KOT49H I9301IXXUANL1 release-keys");
        property_override("ro.product.model", "GT-I9301I");
        property_override("ro.product.device", "s3ve3g");
        property_override("ro.telephony.default_network", "0");
    } else if (bootloader.find("I9301Q")==0) {
        /* s3ve3gjv */
        property_override("ro.vendor.build.fingerprint", "samsung/s3ve3gjv/s3ve3g:4.4.2/KOT49H/I9301QXXUANH1:user/release-keys");
        property_override("ro.build.fingerprint", "samsung/s3ve3gjv/s3ve3g:4.4.2/KOT49H/I9301QXXUANH1:user/release-keys");
        property_override("ro.build.description", "s3ve3gjv-user 4.4.2 KOT49H I9301QXXUANH1 release-keys");
        property_override("ro.product.model", "GT-I9301Q");
        property_override("ro.product.device", "s3ve3gjv");
        property_override("ro.telephony.default_network", "0");
    } else if (bootloader.find("I9300I")==0) {
        /* s3ve3gds */
        property_override("ro.vendor.build.fingerprint", "samsung/s3ve3gdsxx/s3ve3gds:4.4.4/KTU84P/I9300IXWUBNJ1:user/release-keys");
        property_override("ro.build.fingerprint", "samsung/s3ve3gdsxx/s3ve3gds:4.4.4/KTU84P/I9300IXWUBNJ1:user/release-keys");
        property_override("ro.build.description", "s3ve3gdsxx-user 4.4.4 KTU84P I9300IXWUBNJ1 release-keys");
        property_override("ro.product.model", "GT-I9300I");
        property_override("ro.product.device", "s3ve3gds");
        property_override("ro.multisim.set_audio_params", "true");
        property_override("ro.multisim.simslotcount", "2");
        property_override("persist.radio.multisim.config", "dsds");
        property_override("ro.telephony.default_network", "0,1");
    } else {
        /* DEFAULT */
        property_override("ro.vendor.build.fingerprint", "samsung/s3ve3gxx/s3ve3g:4.4.2/KOT49H/I9301IXXUANL1:user/release-keys");
        property_override("ro.build.fingerprint", "samsung/s3ve3gxx/s3ve3g:4.4.2/KOT49H/I9301IXXUANL1:user/release-keys");
        property_override("ro.build.description", "s3ve3gxx-user 4.4.2 KOT49H I9301IXXUANL1 release-keys");
        property_override("ro.product.model", "GT-I9301I");
        property_override("ro.product.device", "s3ve3g");
        property_override("ro.telephony.default_network", "0");
    }
}


void vendor_load_properties() {
    init_variant_properties();
}
