# TWRP device tree for Motorola One

## How to Build

```
# Sync Source code
mkdir ~/TWRP-9 && cd ~/TWRP-9
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
repo sync  -f --force-sync --no-clone-bundle --no-tags -j$(nproc --all)

# Clone dependencies
git clone --depth=1 https://github.com/100Daisy/twrp_device_motorola_deen -b android-9 device/motorola/deen
git clone --depth=1 https://github.com/100Daisy/android_kernel_motorola_deen -b twrp kernel/motorola/msm8953
git clone --depth=1 https://github.com/osm0sis/twrp_abtemplate device/motorola/deen/installer

# Build TWRP
export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch omni_deen-eng; make -j$(nproc --all) recoveryimage

# Make the recovery installer
cp -fr device/motorola/deen/installer out/target/product/deen
cd out/target/product/deen
cp -f ramdisk-recovery.cpio installer
cd installer
zip -qr recovery-installer ./
cd .. &&  cp -f installer/recovery-installer.zip .
```
## Sources
Big Thanks to LinkBoi00, he helped me a lot with decryption and bootslot's
Without him i propably will never fix these issue's

Kernel source: https://github.com/100Daisy/android_kernel_motorola_deen/tree/twrp

[![Build Status](https://cloud.drone.io/api/badges/100Daisy/twrp_device_motorola_deen/status.svg)](https://cloud.drone.io/100Daisy/twrp_device_motorola_deen)

###### Donate
[PayPal](https://www.paypal.me/100Daisy)
