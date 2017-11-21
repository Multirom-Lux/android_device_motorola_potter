#
# Copyright (C) 2015-2016 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/motorola/potter

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_CORTEX_A53 := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_BOARD_PLATFORM := msm8953

TARGET_BOOTLOADER_BOARD_NAME := MSM8953
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 vmalloc=350M androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_MKBOOTIMG_ARGS :=  --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --kernel_offset 0x00008000 --dt device/motorola/potter/dt.img
BOARD_CUSTOM_BOOTIMG_MK := device/motorola/potter/mkbootimg.mk
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

LZMA_RAMDISK_TARGETS := recovery

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216        #    16384 * 1024 mmcblk0p37
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    #    16484 * 1024 mmcblk0p38
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296    #  4194304 * 1024 mmcblk0p53
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25614597120 # 25014255 * 1024 mmcblk0p54

# don't take forever to wipe
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP
TARGET_RECOVERY_FSTAB := device/motorola/potter/twrp.fstab
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := RGB_565
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_NEW_ION_HEAP := true
TW_THEME := portrait_hdpi
TW_SCREEN_BLANK_ON_BOOT := true

# MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_DEV_BLOCK_BOOTDEVICE := true
MR_INIT_DEVICES := $(LOCAL_PATH)/multirom/mr_init_devices.c
MR_DPI := xhdpi
MR_DPI_FONT := 340
DEVICE_RESOLUTION := 1080x1920
MR_PIXEL_FORMAT := "RGBA_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
MR_FSTAB := $(LOCAL_PATH)/multirom/mrom.fstab
MR_KEXEC_MEM_MIN := 0x85000000
MR_KEXEC_DTB := true
MR_USE_MROM_FSTAB := true
MR_CONTINUOUS_FB_UPDATE := true
MR_NO_KEXEC := enabled
TARGET_RECOVERY_IS_MULTIROM := true

# Versioning
MR_DEVICE_SPECIFIC_VERSION := e
include $(LOCAL_PATH)/multirom/MR_REC_VERSION.mk
BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
