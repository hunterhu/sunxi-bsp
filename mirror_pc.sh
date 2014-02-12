#!/bin/bash

#TODO
# 1> take rsync type argument, sunxi-bsp or rootfs-projects, or even more generic
# 2> take server IP address

SERVER_IP="192.168.1.101"

BSP_SRC="/home/hunter/projects/sunxi-bsp/"
BSP_DEST="root@$SERVER_IP:/home/hunter/projects/sunxi-bsp/"

ROOTFS_SRC="/home/hunter/rootfs-projects/"
ROOTFS_DEST="root@$SERVER_IP:/home/hunter/rootfs-projects/"


#mirror macbook pro sunxi-bsp to the server
echo "Mirroring $BSP_SRC to $BSP_DEST ... ..."
sudo rsync -avxHAXW --progress --delete $BSP_SRC $BSP_DEST

#mirror macbook pro rootfs-projects to the server
echo "Mirroring $ROOTFS_SRC to $ROOTFS_DEST ... ..."
sudo rsync -avxHAXW --progress --delete $ROOTFS_SRC $ROOTFS_DEST
