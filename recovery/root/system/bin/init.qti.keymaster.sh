#! /vendor/bin/sh
#####################################################################
# Copyright (c) 2019-2022 Qualcomm Technologies, Inc.
# Copyright (c) 2023 by EneTec
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
#####################################################################


soc_id=`cat /sys/devices/soc0/soc_id` 2> /dev/null
spu=$(getprop persist.vendor.enable_spu)

if [ "$spu" == "true"] then
	start keymaster-4-1-qti
	start keymaster-sb-4-0-qti
else
    setprop vendor.gatekeeper.disable_spu false
fi
