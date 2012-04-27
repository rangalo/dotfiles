#!/bin/bash

# source the function file
. /home/hardik/bin/aumix-functions.sh

current_vol=`getVolume`
echo $current_vol

if [ $current_vol -ne "0" ]; then
    aumix -S
    aumix -v 0
    echo "Mute" | osd_cat  -p middle -A center -d 2 -f "-*-new century schoolbook-*-*-*-*-34-*-*-*-*-*-*-*"
else 
    aumix -L
    echo "UnMute" | osd_cat -c green -p middle -A center -d 2 -f "-*-new century schoolbook-*-*-*-*-34-*-*-*-*-*-*-*"
fi


