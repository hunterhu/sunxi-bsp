#!/bin/bash

SABERTOOTH_IP="10.200.146.32"

PRJ_SRC="/home/hunter/projects/"
PRJ_DEST="root@$SABERTOOTH_IP:/home/core/projects/"

#mirror macbook pro ~/projects to the server
echo "Mirroring $PRJ_SRC to $PRJ_DEST ... ..."
sudo rsync -avxHAXW --progress --delete --exclude-from=exclude-files.txt $PRJ_SRC $PRJ_DEST

