#!/bin/bash

ROM=nezuko
ROM_NAME=NezukoOS
BUILD_TYPE=Official
DEVICE=Cheeseburger

API_KEY=XXXX
CHAT_ID=XXXX

ROM_FOLDER="${PWD}"
KERNEL=$(sed -nr 's/.*TARGET_KERNEL_CONFIG :=\s(.*)_defconfig.*/\1/p' device/oneplus/msm8998-common/BoardConfigCommon.mk)

# Set up environment
. build/envsetup.sh

BUILD_START=$(date +"%s")

# Send Build Start Msg
read -r -d '' MESSAGE <<-_EOL_
<strong>Build Started!</strong>
<strong>@</strong> $(date "+%I:%M%p") ($(date +"%Z%:z"))
<strong>CPUs :</strong> $(nproc --all) <strong>|</strong> <strong>RAM :</strong> $(awk '/MemTotal/ { printf "%.1f \n", $2/1024/1024 }' /proc/meminfo)GB
<strong>Building :</strong> ${ROM_NAME}
<strong>Build Type :</strong> ${BUILD_TYPE}
<strong>Device :</strong> ${DEVICE}
<strong>Kernel :</strong> ${KERNEL}
_EOL_
curl -s -X POST -d chat_id="${CHAT_ID}" -d parse_mode=html -d text="${MESSAGE}" https://api.telegram.org/bot"${API_KEY}"/sendMessage > /dev/null

# Choose a target
lunch aosp_cheeseburger-userdebug

# Install Clean
if [ "$1" == "-ic" ]; then
	echo "CLEAN BUILD!"
	mka installclean
fi

# Build the code
mka bacon -j4 2>&1 | tee "${ROM}"-build.log

# Send Build End Msg
if ! grep -q "build completed successfully" "${ROM_FOLDER}"/"${ROM}"-build.log; then
    curl -F chat_id="${CHAT_ID}" -F document=@"${ROM_FOLDER}"/"${ROM}"-build.log -F caption="Build Failed!" https://api.telegram.org/bot"${API_KEY}"/sendDocument > /dev/null
    grep "error:" "${ROM_FOLDER}"/"${ROM}"-build.log > "${ROM_FOLDER}"/"${ROM}"-errors.log

    curl -F chat_id="${CHAT_ID}" -F document=@"${ROM_FOLDER}"/"${ROM}"-errors.log https://api.telegram.org/bot"${API_KEY}"/sendDocument > /dev/null
else
  BUILD_END=$(date +"%s")
  DIFF=$((BUILD_END - BUILD_START))
  # Send msg to telegram
  read -r -d '' MESSAGE <<-_EOL_
<strong>BUILD SUCCESSFULL!</strong>
<strong>Time :</strong> $((DIFF / 60)) minutes and $((DIFF % 60)) seconds
<strong>Date :</strong> $(date +"%Y-%m-%d")
_EOL_
  curl -s -X POST -d chat_id="${CHAT_ID}" -d parse_mode=html -d text="${MESSAGE}" https://api.telegram.org/bot"${API_KEY}"/sendMessage > /dev/null
fi








