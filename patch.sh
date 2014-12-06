#!/bin/bash

cd ..

COUNT=0
CURRENT_DIR="$PWD"
PD="build_tools/patches"
PATCHES=(
'frameworks/av					frameworks_av.patch'
'frameworks/base				frameworks_base.patch'
'frameworks/native				frameworks_native.patch'
'frameworks/opt/net/wifi		frameworks_opt_net_wifi.patch'
'frameworks/opt/telephony		frameworks_opt_telephony.patch'
'hardware/broadcom/libbt		hardware_broadcom_libbt.patch'
'system/core					system_core.patch'
'vendor/cm						vendor_cm.patch'
)

while [ "x${PATCHES[COUNT]}" != "x" ]
do
	CURRENT="${PATCHES[COUNT]}"
    FOLDER=`echo "$CURRENT" | awk '{print $1}'`
	PATCH=`echo "$CURRENT" | awk '{print $2}'`

	cd "$FOLDER"
	echo Patching "$FOLDER" ...
	git apply "$CURRENT_DIR/$PD/$PATCH"
	cd "$CURRENT_DIR"

	COUNT=$(($COUNT + 1))
done
