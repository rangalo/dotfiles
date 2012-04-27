#!/bin/bash

# source the function file
. /home/hardik/bin/aumix-functions.sh

aumix -v +2 

current_vol=`getVolume`
echo $current_vol

TEXT="$current_vol%"
osd_cat -A center -p middle -b percentage -P $current_vol -T $TEXT -d 1 -O 10 -c green  -f "-*-new century schoolbook-*-*-*-*-34-*-*-*-*-*-*-*"

