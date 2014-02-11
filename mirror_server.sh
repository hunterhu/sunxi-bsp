#!/bin/bash

#TODO
# 1> take rsync type argument, sunxi-bsp or rootfs-projects, or even more generic
# 2> take server IP address

SERVER_IP="10.200.146.32"

BSP_SRC="/home/hunter/projects/sunxi-bsp/"
BSP_DEST="root@$SERVER_IP:/home/core/projects/sunxi-bsp/"

ROOTFS_SRC="/home/hunter/rootfs-projects/"
ROOTFS_DEST="root@$SERVER_IP:/home/core/rootfs-projects/"

usage="$(basename "$0") [bsp] [rootfs]"

if [ "$#" == 0 ]; then
    echo $usage
    exit
fi

#mirror macbook pro sunxi-bsp to the server
if [ "$1" == "bsp" ] || [ "$2" == "bsp" ]; then
    echo "Mirroring $BSP_SRC to $BSP_DEST ... ..."
    sudo rsync -avxHAXW --progress --delete $BSP_SRC $BSP_DEST
fi

#mirror macbook pro rootfs-projects to the server
if [ "$1" == "rootfs" ] || [ "$2" == "rootfs" ]; then
    echo "Mirroring $ROOTFS_SRC to $ROOTFS_DEST ... ..."
    sudo rsync -avxHAXW --progress --delete $ROOTFS_SRC $ROOTFS_DEST
fi
