#!/bin/bash

DEST="/tmp/motion"

#start with a clean $DEST
rm -rf $DEST

#start the motion
motion &
pid=`pgrep motion`

while true
do
    #start monitoring the $DEST
    while inotifywait -e modify $DEST; do
        #pause motion
        kill --STOP $pid
        #processing every *.jpg in $DEST
        for file in $DEST/*.jpg; do

            #for development only
            #preview the picture on the screen
            gpicview file &
            sleep 5
            killall gpicview

            #analyze the picture
            #for production:capture a good output
            #and present it to the upper layer
            echo "Analyzing ..."
            zbarimg file &
            sleep 5	
        done
        #resume motion
        kill --CONT $pid
    done
done
