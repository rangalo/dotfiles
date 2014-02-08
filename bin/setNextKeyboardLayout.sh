#!/bin/bash

CMD="/home/hardik/desklets/SwitchKbLayoutDesk/src/setNextKbLayout.py"
LAYOUT=`$CMD`

echo $LAYOUT | osd_cat -A center -p middle -d 1 -O 10 -c green  -f "-*-new century schoolbook-*-*-*-*-34-*-*-*-*-*-*-*"
