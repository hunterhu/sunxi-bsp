#!/bin/bash

submodules=( linux-sunxi u-boot-sunxi sunxi-boards )

clear
if [ "" == "$1" ]; then
    for repo in "${submodules[@]}"
    do
            echo "==== \"$repo\" ===="
            cd ./$repo
            git branch
            cd ..
            echo ""
    done

    echo "=========================="
    echo "which branch to switch to?"
    echo "=========================="
    exit 1
fi

for repo in "${submodules[@]}"
do
        echo "==== \"$repo\" ===="
        cd ./$repo
        git checkout $1
        git branch
        cd ..
        echo ""
done
