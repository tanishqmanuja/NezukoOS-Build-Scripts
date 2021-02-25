#!/bin/bash

# Delete Trees
rm -rf device/oneplus/msm8998-common
rm -rf device/oneplus/cheeseburger
rm -rf vendor/oneplus

# Clone Trees
git clone https://github.com/Maitreya29/android_device_oneplus_msm8998-common device/oneplus/msm8998-common

git clone https://github.com/Maitreya29/android_device_oneplus_cheeseburger device/oneplus/cheeseburger

git clone https://github.com/Maitreya29/android_vendor_oneplus vendor/oneplus

# Add gCam
mkdir -p device/oneplus/msm8998-common/prebuilts/system/priv-app/GoogleCamera
cp ~/gCam/gCam.apk device/oneplus/msm8998-common/prebuilts/system/priv-app/GoogleCamera/GoogleCamera.apk
