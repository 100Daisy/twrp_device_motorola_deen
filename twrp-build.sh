#!bin/bash

# Go to the working directory
mkdir ~/SHRP-9 && cd ~/SHRP-9
# Configure git
git config --global user.email "100Daisy@protonmail.com"
git config --global user.name "GitDaisy"
git config --global color.ui false
# Sync the source
repo init --depth=1 -u git://github.com/SHRP/platform_manifest_twrp_omni.git -b v3_9.0
repo sync  -f --force-sync --no-clone-bundle --no-tags -j$(nproc --all)
# Clone device tree and common tree
git clone --depth=1 https://github.com/100Daisy/twrp_device_motorola_deen -b shrp-9 device/motorola/deen
# Build recovery image
export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch omni_deen-eng; make -j$(nproc --all) recoveryimage
# Make the recovery installer
cd out/target/product/deen
ls
# Rename and copy the files
date_time=$(date +"%d%m%Y%H%M")
mkdir ~/final
cp recovery.img ~/final/SHRP_v3.0_stable-Unofficial_deen-"$date_time".img
cp SHRP*.zip ~/final/
# Upload to oshi.at
curl -T ~/final/*.img https://oshi.at
curl -T ~/final/SHRP_v3.0_stable-Unofficial_deen-*.zip https://oshi.at
curl -T ~/final/SHRP_AddonRescue_v3.0_deen-*.zip https://oshi.at
