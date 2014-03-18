#!/bin/bash

RAPTOR_IP="10.200.146.89"

PRJ_SRC="/home/hunter/projects/"
PRJ_DEST="root@$RAPTOR_IP:/home/raptor/projects/"

#mirror macbook pro ~/projects to the raptor 
echo "Mirroring $PRJ_SRC to $PRJ_DEST ... ..."
sudo rsync -avxHAXW --progress --delete $PRJ_SRC $PRJ_DEST

