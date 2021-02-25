#!/bin/bash

cd device/oneplus/msm8998-common

# Favor GCamGo over GCam
git cherry-pick ef129128d8882a4e87790ed249810dd6e2af733d

# Drop GSoundRec
git cherry-pick 0a6bb58b427f1ba2ecd419d6ac66541b899eb6e8

# Change Maintainer (I m build Tester ..but stiil looks cool)
sed -i 's/NEZUKO_MAINTAINER := Maitreya29/NEZUKO_MAINTAINER := mrStark0018/g' common.mk

# Favor Tanjiro
#git cherry-pick 4456809e0d662b5174b1610526a81654d98ca7a7
#sed -i 's@TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998@TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998-tanjiro@g' BoardConfigCommon.mk
sed -i 's/TARGET_KERNEL_CONFIG := lazy_defconfig/TARGET_KERNEL_CONFIG := tanjiro_defconfig/g' BoardConfigCommon.mk
sed -i 's/TARGET_KERNEL_CLANG_VERSION := proton/#TARGET_KERNEL_CLANG_VERSION := proton/g' BoardConfigCommon.mk

git commit -am "Device Mods"

