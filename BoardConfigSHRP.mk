################################################################
#                                                              #
#                   S       H       R       P                  #
#                                                              #
################################################################
# Copyright 2023 by EneTec                                     #
################### ############################################
# MANDATORY FLAGS # These flags HAVE TO be set/changed by you! #
################### ############################################

# Simulate decryption for ND versions
TW_SIMULATE_DECRYPT := true
TW_DEVICE_VERSION := qc2_ND

# Device codename
# Default (if not set): N/A
SHRP_DEVICE_CODE := SHRP_eqs_v.0.8.2

# Recovery Type (for "About" section only)
# Default (if not set): N/A
SHRP_REC_TYPE := Beta_v.0.8.2_ND_build_308292

# Path of your SHRP device tree
# Replace <device-brand> with the device brand name
# (SHRP_DEVICE_CODE will expand to the above variable so check if that is correct)
SHRP_PATH := device/motorola/$(SHRP_DEVICE_CODE)

# Maintainer name
# Default (if not set): N/A
SHRP_MAINTAINER := EneTec

# Device Type (for "About" section only)
# Default (if not set): N/A
SHRP_DEVICE_TYPE := vA/B

# Your device's recovery path, dont use blindly
# Default (if not set): N/A
SHRP_REC := /dev/block/bootdevice/by-name/recovery

# Use this flag only if SHRP_REC is set
# Default (if not set): N/A
SHRP_HAS_RECOVERY_PARTITION := true

# Use this flag only if your device is A/B or Virtual A/B.
# Default (if not set): N/A
SHRP_AB := true

################### ################################################################################
# IMPORTANT FLAGS # These are usually good to check - at least if the defaults are what you expect #
################### ################################################################################

# Emergency DownLoad mode (0 = no EDL mode, 1 = EDL mode available)
# Default (if not set): 0
SHRP_EDL_MODE := 0

# Internal storage path
# Default (if not set): /sdcard
#SHRP_INTERNAL := /sdcard

# External SDcard path
# Default (if not set): /
#SHRP_EXTERNAL := /external_sd

# USB OTG path
# Default (if not set): /
SHRP_OTG := /usb_otg

# Flashlight: (0 = disable, 1 = enable)
# Default (if not set): 0
SHRP_FLASH := 0

# For notch devices
# Default (if not set): N/A
SHRP_NOTCH := true

# Do not include the SHRP theming system
# Useful to save space for devices with a smaller recovery partition
# Default (if not set) is full theming support
SHRP_LITE := true

# SHRP Dark mode, use this flag to have dark theme set by default
# Default (if not set) is not using DARK mode
SHRP_DARK := true

# Addon - Substratum Overlay (OMS -Normal- disabler)
# Default (if not set) is not skipping this addon (i.e. add it)
# Ensure you understood the above note on the default behavior!
SHRP_SKIP_DEFAULT_ADDON_1 := false
# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store this addon into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_ADDON_1 := true

# Addon - Substratum Overlay (OMS -legacy- disabler)
# Default (if not set) is not skipping this addon (i.e. add it)
# Ensure you understood the above note on the default behavior!
SHRP_SKIP_DEFAULT_ADDON_2 := false
# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store this addon into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_ADDON_2 := true

# Addon - Clear Fingerprint (remove fingerprint lock from system)
# Default (if not set) is not skipping this addon (i.e. add it)
# Ensure you understood the above note on the default behavior!
SHRP_SKIP_DEFAULT_ADDON_3 := false
# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store this addon into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_ADDON_3 := true

# Addon - Force Encryption (remove force encryption from your device)
# Default (if not set) is not skipping this addon (i.e. add it)
# Ensure you understood the above note on the default behavior!
SHRP_SKIP_DEFAULT_ADDON_4 := true
# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store this addon into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
#INC_IN_REC_ADDON_4 := true

# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store magisk zip into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_MAGISK := true

# Default (if not set) will show magisk root and unroot option inside the recovery.
# To hide the prebuilt magisk flash option from recovery, set value to "true".
# Ensure you understood the above note on the default behavior!
SHRP_EXCLUDE_MAGISK_FLASH := false

############################ #########################################################
# CUSTOM ADDONS - OPTIONAL # Custom addons! Yea fully optional but.. GREAT STUFF! :) #
############################ #########################################################

# SHRP can be extended as YOU wish! You can add whatever you can think of
# e.g patching a ROM, adding stuff, apps, there is no limit ;)
# Addons will be shown in the "Tweaks" section of SHRP.

# Custom addon folder. Do not forget to put a "/" at the end of the path!
SHRP_EXTERNAL_ADDON_PATH := "device/motorola/eqs/shrp-addon/"

# Addon #1 - Name
SHRP_EXTERNAL_ADDON_1_NAME := Populate_A/B
# Addon #1 - Description
SHRP_EXTERNAL_ADDON_1_INFO := "Copy Partitions v.20220613 to populate unused A/B slots"
# Addon #1 - Addon file name as ZIP (zip format is required)
SHRP_EXTERNAL_ADDON_1_FILENAME := copy-partitions-20220613-signed.zip
# Addon #1 - Free defineable button text the user need to press to actually install that addon
# (Examples: Ok, Install, Flask, Enable, Disable, etc)
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := Execute
# Addon #1 - Text beeing shown when the installation was successful
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := Done!
# Addon #1 - Inject the addon into the recovery (if so: be sure that it will fit into the partition)
# Default (if not set) is NOT adding this addon into the recovery ramdisk. That means:
# If you do NOT set this the addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons)
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true

# Addon #2 - Name
SHRP_EXTERNAL_ADDON_2_NAME := Disable_Forced_Encryption
# Addon #2 - Description
SHRP_EXTERNAL_ADDON_2_INFO := "Disable Forced Encryption patch v.S1"
# Addon #2 - Addon file name as ZIP (zip format is required)
SHRP_EXTERNAL_ADDON_2_FILENAME := DFE_S1.zip
# Addon #2 - Free defineable button text the user need to press to actually install that addon
# (Examples: Ok, Install, Flask, Enable, Disable, etc)
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := Flash
# Addon #2 - Text beeing shown when the installation was successful
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := Done!
# Addon #2 - Inject the addon into the recovery (if so: be sure that it will fit into the partition)
# Default (if not set) is NOT adding this addon into the recovery ramdisk. That means:
# If you do NOT set this the addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons)
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true

# Addon #3 - Name
SHRP_EXTERNAL_ADDON_3_NAME := Install_Data_Backup_Magisk_Module
# Addon #3 - Description
SHRP_EXTERNAL_ADDON_3_INFO := "data_backup v.2.14 Magisk Module installer to backup all your data/media by terminal command to USB key (on booted system and even if in encrypted status!)"
# Addon #3 - Addon file name as ZIP (zip format is required)
SHRP_EXTERNAL_ADDON_3_FILENAME := data_backup_v2.14-MAGISK.zip
# Addon #3 - Free defineable button text the user need to press to actually install that addon
# (Examples: Ok, Install, Flask, Enable, Disable, etc)
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := Install
# Addon #3 - Text beeing shown when the installation was successful
SHRP_EXTERNAL_ADDON_3_SUCCESSFUL_TEXT := Done!
# Addon #3 - Inject the addon into the recovery (if so: be sure that it will fit into the partition)
# Default (if not set) is NOT adding this addon into the recovery ramdisk. That means:
# If you do NOT set this the addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons)
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true

# Addon #4 - Name
SHRP_EXTERNAL_ADDON_4_NAME := Data/Media_Restore_from_USB_key
# Addon #4 - Description
SHRP_EXTERNAL_ADDON_4_INFO := "data_restore v.2.14 started in interactive mode to recover your data/media backup contained in USB key (NOTES: please mount USB-OTG before using this! Forced encryption disabled and/or a /data partition format could be needed too!)"
# Addon #4 - Addon file name as ZIP (zip format is required)
SHRP_EXTERNAL_ADDON_4_FILENAME := data_restore_v2.14-MAGISK-TWRP-a.zip
# Addon #4 - Free defineable button text the user need to press to actually install that addon
# (Examples: Ok, Install, Flask, Enable, Disable, etc)
SHRP_EXTERNAL_ADDON_4_BTN_TEXT := Restore
# Addon #4 - Text beeing shown when the installation was successful
SHRP_EXTERNAL_ADDON_4_SUCCESSFUL_TEXT := Done!
# Addon #4 - Inject the addon into the recovery (if so: be sure that it will fit into the partition)
# Default (if not set) is NOT adding this addon into the recovery ramdisk. That means:
# If you do NOT set this the addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons)
SHRP_INC_IN_REC_EXTERNAL_ADDON_4 := true

# Addon #5 - Name
SHRP_EXTERNAL_ADDON_5_NAME := Flash_Test
# Addon #5 - Description
SHRP_EXTERNAL_ADDON_5_INFO := "Do-nothing zip for testing purpose..."
# Addon #5 - Addon file name as ZIP (zip format is required)
SHRP_EXTERNAL_ADDON_5_FILENAME := HelloWorld-signed.zip
# Addon #5 - Free defineable button text the user need to press to actually install that addon
# (Examples: Ok, Install, Flask, Enable, Disable, etc)
SHRP_EXTERNAL_ADDON_5_BTN_TEXT := Execute
# Addon #5 - Text beeing shown when the installation was successful
SHRP_EXTERNAL_ADDON_5_SUCCESSFUL_TEXT := Done!
# Addon #5 - Inject the addon into the recovery (if so: be sure that it will fit into the partition)
# Default (if not set) is NOT adding this addon into the recovery ramdisk. That means:
# If you do NOT set this the addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons)
SHRP_INC_IN_REC_EXTERNAL_ADDON_5 := true