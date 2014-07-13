#!/bin/bash

pause() {
	sleep 4
}

SRC="./build/a20-olinuxino_micro_hwpack/kernel/uImage"
DST="$HOME/projects/nand-contents-container/nand-contents/uImage"

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
echo "DONE"
echo ""
