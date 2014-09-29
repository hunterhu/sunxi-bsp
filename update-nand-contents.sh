#!/bin/bash

pause() {
	sleep 2
}

clear

#SRC="./build/a20-som-kiosk-egtouch_hwpack/"
SRC=""
#DST="$HOME/projects/a20-som-nand-contents-container/nand-contents"
DST=""
echo "Using the following SRC and DST, stop me if they don't look right..."
echo "SRC = $SRC"
echo "DST = $DST"
pause;pause

SRC_UIMAGE="$SRC/kernel/uImage"
DST_UIMAGE="$DST/uImage"

SRC_SCRIPT="$SRC/kernel/script.bin"
DST_SCRIPT="$DST/script.bin.lcd4.3"

SRC_LIB="$SRC/rootfs/lib"
DST_LIB="$DST/rootfs/lib"

echo ""
echo "Updating uImage ..."
echo "From: $SRC_UIMAGE"
echo "  To: $DST_UIMAGE"
pause
sudo cp $SRC_UIMAGE $DST_UIMAGE

echo ""
echo "Updating script.bin ..."
echo "From: $SRC_SCRIPT"
echo "  To: $DST_SCRIPT"
echo ""
pause
sudo cp $SRC_SCRIPT $DST_SCRIPT

echo "Removing old modules ..."
echo "From: $DST_LIB"
pause
sudo rm -rf $DST_LIB/*

echo ""
echo "Copying new modules ..."
echo "From: $SRC_LIB"
echo "  To: $DST_LIB"
pause
if [ ! -d $DST_LIB ]; then
        sudo mkdir -p $DST_LIB
fi
sudo cp -R $SRC_LIB/* $DST_LIB
echo "sync ..."
sync
echo "DONE"
