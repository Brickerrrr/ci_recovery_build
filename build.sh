#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

mkdir -p /tmp/recovery

cd /tmp/recovery

sudo apt install git -y

# repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0 -g default,-device,-mips,-darwin,-notdefault

repo init --depth=1 -u git://github.com/SHRP/platform_manifest_twrp_omni.git -b v3_10.0 -g default,-device,-mips,-darwin,-notdefault
 


repo sync -j$(nproc --all)


git clone https://github.com/SHRP-Devices/android_device_realme_RMX1901.git -b ten device/realme/RMX1901

rm -rf out

. build/envsetup.sh && lunch omni_RMX1901-eng && export ALLOW_MISSING_DEPENDENCIES=true && export LC_ALL="C" && mka recoveryimage

# Upload zips & recovery.img (U can improvise lateron adding telegram support etc etc)

cd out/target/product/RMX1901

curl -sL https://git.io/file-transfer | sh 

./transfer wet *.zip

./transfer wet recovery.img
