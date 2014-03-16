#!/bin/bash

PC_IP="10.0.1.22"

PRJ_SRC="/home/hunter/projects/"
PRJ_DEST="root@$PC_IP:/home/hunter/projects/"

echo "Mirroring $PRJ_SRC to $PRJ_DEST ... ..."
sudo rsync -avxHAXW --progress $PRJ_SRC $PRJ_DEST
