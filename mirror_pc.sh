#!/bin/bash

PC_IP="192.168.1.130"

PRJ_SRC="/home/hunter/projects/"
PRJ_DEST="root@$PC_IP:/home/hunter/projects/"

echo "Mirroring $PRJ_SRC to $PRJ_DEST ... ..."
sudo rsync -avxHAXW --progress --delete $PRJ_SRC $PRJ_DEST
