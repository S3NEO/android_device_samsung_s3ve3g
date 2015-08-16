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

#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_msm.h"

void init_msm_properties(unsigned long msm_id, unsigned long msm_ver, char *board_type)
{
    char platform[PROP_VALUE_MAX];
    char bootloader[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    char devicename[PROP_VALUE_MAX];
    int rc;

    UNUSED(msm_id);
    UNUSED(msm_ver);
    UNUSED(board_type);

    rc = property_get("ro.board.platform", platform);
    if (!rc || !ISMATCH(platform, ANDROID_TARGET))
        return;

    property_get("ro.bootloader", bootloader);

    if (strstr(bootloader, "I9301I")) {
        /* s3ve3g */
        property_set("ro.build.fingerprint", "samsung/s3ve3gxx/s3ve3g:4.4.2/KOT49H/I9301IXXUANL1:user/release-keys");
        property_set("ro.build.description", "s3ve3gxx-user 4.4.2 KOT49H I9301IXXUANL1 release-keys");
        property_set("ro.product.model", "GT-I9301I");
        property_set("ro.product.device", "s3ve3g");
        property_set("ro.telephony.ril_class", "SamsungMSM8226RIL");
        gsm_properties();
    } else if (strstr(bootloader, "I9301Q")) {
        /* s3ve3gjv */
        property_set("ro.build.fingerprint", "samsung/s3ve3gjv/s3ve3g:4.4.2/KOT49H/I9301QXXUANH1:user/release-keys");
        property_set("ro.build.description", "s3ve3gjv-user 4.4.2 KOT49H I9301QXXUANH1 release-keys");
        property_set("ro.product.model", "GT-I9301Q");
        property_set("ro.product.device", "s3ve3gjv");
        property_set("ro.telephony.ril_class", "SamsungMSM8226RIL");
        gsm_properties();
    } else if (strstr(bootloader, "I9300I")) {
        /* s3ve3gds */
        property_set("ro.build.fingerprint", "samsung/s3ve3gdsxx/s3ve3gds:4.4.4/KTU84P/I9300IXWUBNJ1:user/release-keys");
        property_set("ro.build.description", "s3ve3gdsxx-user 4.4.4 KTU84P I9300IXWUBNJ1 release-keys");
        property_set("ro.product.model", "GT-I9300I");
        property_set("ro.product.device", "s3ve3gds");
        property_set("ro.multisim.set_audio_params", "true");
        property_set("ro.multisim.simslotcount", "2");
        property_set("persist.radio.multisim.config", "dsds");
        property_set("ro.telephony.ril_class", "SamsungMSM8226DSRIL");
        gsm_properties();
    }

    property_get("ro.product.device", device);
    strlcpy(devicename, device, sizeof(devicename));
    INFO("Found bootloader id %s setting build properties for %s device\n", bootloader, devicename);
}

void gsm_properties()
{
    property_set("telephony.lteOnGsmDevice", "0");
    property_set("ro.telephony.default_network", "0");
}
