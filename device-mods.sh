#!/bin/bash

cd device/oneplus/msm8998-common

# Change Maintainer
sed -i 's/NEZUKO_MAINTAINER := Maitreya29/NEZUKO_MAINTAINER := mrStark0018/g' common.mk

# Favor Tanjiro
#git cherry-pick 4456809e0d662b5174b1610526a81654d98ca7a7
#sed -i 's@TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998@TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998-tanjiro@g' BoardConfigCommon.mk
sed -i 's/TARGET_KERNEL_CONFIG := lazy_defconfig/TARGET_KERNEL_CONFIG := tanjiro_defconfig/g' BoardConfigCommon.mk
sed -i 's/TARGET_KERNEL_CLANG_VERSION := proton/#TARGET_KERNEL_CLANG_VERSION := proton/g' BoardConfigCommon.mk

#git add .
#git commit -am "Device Mods"

