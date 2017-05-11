
#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    "/sys/class/graphics/fb0",

    "/sys/block/mmcblk0",
    "/sys/devices/soc/7824900.sdhci",
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0",
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0/mmc0:0001",
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0",
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p37", // boot
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p52", // cache
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p19", // modem
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p30", // persist
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p53", // system
    "/sys/devices/soc/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p54", // userdata
    "/sys/bus/mmc",
    "/sys/bus/mmc/drivers/mmcblk",
    "/sys/module/mmc_core",
    "/sys/module/mmcblk",

    "/sys/devices/soc.0/gpio_keys.70/input*",
    "/sys/devices/virtual/input*",
    "/sys/devices/virtual/misc/uinput",
    "/sys/devices/soc/78b8000.i2c/i2c-3/3-0020/input*",

    // for adb
    "/sys/devices/virtual/tty/ptmx",
    "/sys/class/android_usb/android0*",\
    "/sys/bus/platform/drivers/android_usb",
    "/sys/bus/usb",

    // USB drive is in here
    "/sys/devices/platform/msm_hsusb*",

    // sdcard
    "/sys/devices/soc/7864900.sdhci/mmc_host/mmc1/mmc1:0007/block/mmcblk1",
    "/sys/devices/soc/7864900.sdhci/mmc_host/mmc1/mmc1:0007/block/mmcblk1*",

    NULL
};
