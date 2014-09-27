#!/bin/bash

clear
if [ "" == "$1" ]; then
        echo "which branch to switch to?"
        exit 1
fi

submodules=( linux-sunxi u-boot-sunxi sunxi-boards )

for repo in "${submodules[@]}"
do
        echo "==== \"$repo\" ===="
        cd ./$repo
        git checkout $1
        git branch
        cd ..
        echo ""
done
