#!/bin/bash

pause() {
	sleep 2
}

SRC="./build/a20-olinuxino_micro_hwpack/kernel/uImage"
DST="$HOME/projects/nand-contents-container/nand-contents/olinuxino-a20/uImage.olinuxino"

SRC_LIB="./build/a20-olinuxino_micro_hwpack/rootfs/lib"
DST_LIB="$HOME/projects/nand-contents-container/nand-contents/olinuxino-a20/rootfs"

#Updating uImage
echo ""
echo "Updating \"$DST\" from \"$SRC\" ..."
pause
sudo cp $SRC $DST

#Updating kernel modules
echo "Removing old \"$DST_LIB/lib\" ..."
pause
sudo rm -rf $DST_LIB/lib/

echo "Updating \"$DST_LIB\" from \"$SRC_LIB\" ..."
pause
sudo cp -R $SRC_LIB $DST_LIB
echo "DONE"
echo ""
