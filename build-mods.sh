#!/bin/bash

if [ "$1" == "-r" ]; then
	sed -i 's/ic_homepage_device_op/ic_homepage_device/g' packages/apps/Settings/res/drawable/ic_homepage_device_settings.xml
	sed -i 's/NEZUKO_VERSION := 1.2+/NEZUKO_VERSION := 1.2/g' vendor/nezuko/build/core/main_version.mk
else
	sed -i 's/ic_homepage_device/ic_homepage_device_op/g' packages/apps/Settings/res/drawable/ic_homepage_device_settings.xml
	sed -i 's/NEZUKO_VERSION := 1.2/NEZUKO_VERSION := 1.2+/g' vendor/nezuko/build/core/main_version.mk
fi

