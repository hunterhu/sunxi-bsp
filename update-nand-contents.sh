#!/bin/bash

usage() {
	echo ""
	echo "$0: <boardname>"
	echo "    <boardname>: \"olinuxino\" or \"som\""
	echo ""
}

pause() {
	sleep 2
}

if [ "$#" -lt "1" ]; then
	usage
	exit 1
fi

PWD=`pwd`

if [ "$1" == "olinuxino" ]; then
  if [ "$PWD" != "$HOME/projects/olinuxino-a20-sunxi-dev/sunxi-bsp" ]; then
	echo ""
	echo "Wrong directory detected, you requested \"$1\", but we are in \"$PWD\" ..."
	echo ""
	exit 1
  fi

  SRC="./build/a20-olinuxino_micro_hwpack/kernel/uImage"
  DST="$HOME/projects/nand-contents-container/nand-contents/olinuxino-a20/uImage.olinuxino"

  SRC_LIB="./build/a20-olinuxino_micro_hwpack/rootfs/lib"
  DST_LIB="$HOME/projects/nand-contents-container/nand-contents/olinuxino-a20/rootfs"

elif [ "$1" == "som" ]; then
  if [ "$PWD" != "$HOME/projects/som-evb-a20-sunxi-dev/sunxi-bsp" ]; then
    echo ""
	echo "Wrong directory detected, you requested \"$1\", but we are in \"$PWD\" ..."
	echo ""
	exit 1
  fi

  SRC="./build/a20-som_hwpack/kernel/uImage"
  DST="$HOME/projects/nand-contents-container/nand-contents/som-a20/uImage.som"

  SRC_LIB="./build/a20-som_hwpack/rootfs/lib"
  DST_LIB="$HOME/projects/nand-contents-container/nand-contents/som-a20/rootfs"

else
	usage
	exit 1
fi

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
