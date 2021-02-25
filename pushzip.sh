#!/bin/bash

latest_zip=$(ls out/target/product/cheeseburger/NEZUKO*.zip -tp | grep -v /$ |head -1)
if [ "$1" == "-s" ]; then
	adb sideload $latest_zip
else
	adb push $latest_zip /sdcard/NezukoOS_Beta.zip
fi
