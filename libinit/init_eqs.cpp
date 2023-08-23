//
// Copyright (C) 2022 Team Win Recovery Project
//
// SPDX-License-Identifier: Apache-2.0
//

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <sys/resource.h>

#include <android-base/properties.h>
#include <android-base/logging.h>

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;

void property_override(const std::string& name, const std::string& value)
{
    size_t valuelen = value.size();

    prop_info* pi = (prop_info*) __system_property_find(name.c_str());
    if (pi != nullptr) {
        __system_property_update(pi, value.c_str(), valuelen);
    }
    else {
        int rc = __system_property_add(name.c_str(), name.size(), value.c_str(), valuelen);
        if (rc < 0) {
            LOG(ERROR) << "property_set(\"" << name << "\", \"" << value << "\") failed: "
                       << "__system_property_add failed";
        }
    }
}

void load_device_properties(const std::string& description, const std::string& fingerprint, const std::string& device, const std::string& model) {
    property_override("ro.build.description", description);
    property_override("ro.build.fingerprint", fingerprint);
    property_override("ro.build.product", device);
    property_override("ro.product.build.fingerprint", fingerprint);
    property_override("ro.product.device", device);
    property_override("ro.product.name", device);
    property_override("ro.product.model", model);
    property_override("ro.product.odm.build.fingerprint", fingerprint);
    property_override("ro.product.odm.device", device);
    property_override("ro.product.odm.name", device);
    property_override("ro.product.odm.model", model);
    property_override("ro.product.odm_dlkm.build.fingerprint", fingerprint);
    property_override("ro.product.odm_dlkm.device", device);
    property_override("ro.product.odm_dlkm.name", device);
    property_override("ro.product.odm_dlkm.model", model);
    property_override("ro.product.system.build.fingerprint", fingerprint);
    property_override("ro.product.system.device", device);
    property_override("ro.product.system.name", device);
    property_override("ro.product.system.model", model);
    property_override("ro.product.vendor.build.fingerprint", fingerprint);
    property_override("ro.product.vendor.device", device);
    property_override("ro.product.vendor.name", device);
    property_override("ro.product.vendor.model", model);
    property_override("ro.product.vendor_dlkm.build.fingerprint", fingerprint);
    property_override("ro.product.vendor_dlkm.device", device);
    property_override("ro.product.vendor_dlkm.name", device);
    property_override("ro.product.vendor_dlkm.model", model);
    property_override("ro.product.product.build.fingerprint", fingerprint);
    property_override("ro.product.product.device", device);
    property_override("ro.product.product.name", device);
    property_override("ro.product.product.model", model);
    property_override("ro.product.system_ext.build.fingerprint", fingerprint);
    property_override("ro.product.system_ext.device", device);
    property_override("ro.product.system_ext.name", device);
    property_override("ro.product.system_ext.model", model);
}

void vendor_load_properties() {
    const std::string sku = GetProperty("ro.boot.hardware.sku", "");
    if (sku == "XT2241-1") {
        load_device_properties("eqs_ge-user 12 S3SQS32.16-72-31-3 47c58c-b5d541 release-keys", "motorola/eqs_ge/msi:12/S3SQS32M.16-72-31-3/47c58c-b5d541:user/release-keys", "eqs", "Motorola X30 Pro");
    }
    if (sku == "XT2241-2") {
        load_device_properties("eqs_ge-user 12 S3SQS32.16-72-31-3 47c58c-b5d541 release-keys", "motorola/eqs_ge/msi:12/S3SQS32M.16-72-31-3/47c58c-b5d541:user/release-keys", "eqs", "Motorola Edge 30 Ultra");
    }
}
