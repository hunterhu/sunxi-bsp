#!/bin/bash

pause() {
	sleep 4
}

SRC="./build/a20-olinuxino_micro_hwpack/kernel/uImage"
DST="$HOME/projects/nand-contents-container/nand-contents/uImage"

SRC_SCRIPT="./build/a20-olinuxino_micro_hwpack/kernel/script.bin"
DST_SCRIPT="$HOME/projects/nand-contents-container/nand-contents/script.bin.lcd4.3"

SRC_LIB="./build/a20-olinuxino_micro_hwpack/rootfs/lib"
DST_LIB="$HOME/projects/nand-contents-container/nand-contents/rootfs"

#Updating uImage
echo ""
echo "Updating uImage ..."
echo "From: $SRC"
echo "  To: $DST"
echo ""
pause
sudo cp $SRC $DST

#Updating script.bin
echo ""
echo "Updating script.bin ..."
echo "From: $SRC_SCRIPT"
echo "  To: $DST_SCRIPT"
echo ""
pause
sudo cp $SRC_SCRIPT $DST_SCRIPT

#Updating kernel modules
echo "Removing old modules ..."
echo "From: $DST_LIB/lib/"
echo ""
pause
sudo rm -rf $DST_LIB/lib/

echo "Copying new modules ..."
echo "From: $SRC_LIB"
echo "  To: $DST_LIB"
pause
sudo cp -R $SRC_LIB $DST_LIB
echo "sync ..."
sync
echo "DONE"
