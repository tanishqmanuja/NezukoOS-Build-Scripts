#!/bin/bash

# Delete Trees
rm -rf device/oneplus/msm8998-common
rm -rf device/oneplus/cheeseburger
#rm -rf vendor/oneplus

# Clone Trees
git clone https://github.com/Maitreya29/android_device_oneplus_msm8998-common device/oneplus/msm8998-common

git clone https://github.com/Maitreya29/android_device_oneplus_cheeseburger device/oneplus/cheeseburger

#git clone https://git.rip/Maitreya29/vendor_oneplus vendor/oneplus
#git clone https://github.com/Maitreya29/android_vendor_oneplus vendor/oneplus

# Add gCam
mkdir -p device/oneplus/msm8998-common/prebuilts/system/priv-app/GoogleCamera
cp ~/gCam/gCamGo.apk device/oneplus/msm8998-common/prebuilts/system/priv-app/GoogleCamera/GoogleCamera.apk

cd device/oneplus/msm8998-common

# Drop GRec
echo "# Drop Google Recorder" >> common.mk
echo "TARGET_SUPPORTS_GOOGLE_RECORDER := false" >> common.mk

# Change Maintainer and Build
sed -i 's/NEZUKO_BUILD_TYPE := OFFICIAL/NEZUKO_BUILD_TYPE := DEVELOPMENT/g' common.mk
sed -i 's/NEZUKO_MAINTAINER := Maitreya29/NEZUKO_MAINTAINER := mrStark0018/g' common.mk

# Favor Tanjiro
if [ "$1" == "-l" ]; then
	echo "Lazy Config"
else
	echo "Tanjiro Config"
	sed -i 's/TARGET_KERNEL_CONFIG := lazy_defconfig/TARGET_KERNEL_CONFIG := tanjiro_defconfig/g' BoardConfigCommon.mk
	sed -i 's/TARGET_KERNEL_CLANG_VERSION := proton/#TARGET_KERNEL_CLANG_VERSION := proton/g' BoardConfigCommon.mk
fi



