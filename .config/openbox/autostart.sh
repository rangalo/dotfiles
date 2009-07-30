#!/bin/bash

# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

. $GLOBALAUTOSTART

xset -b
# key mapping for multimedia keys


# Load setting for xterm , aterm etc 
xrdb -load /home/hardik/.Xdefaults &

kmix&
xscreensaver  -no-splash &
(sleep 1 && /usr/bin/yeahconsole) &
gkrellm -w &
mpd --kill &
mpd &

(adesklets  -k &&  adesklets) &
# idesk&

# (sleep 3 && pypanel) &
(sleep 3 && /home/hardik/apps/tint/usr/bin/tint2) &
(sleep 2 && /home/hardik/apps/visibility/bin/visibility) &


# wallpaper
eval `cat $HOME/.fehbg` &

xmodmap /home/hardik/.Xmodmap &

(sleep 2 && conky) &
(sleep 2 && conky -c /home/hardik/.conkyrc_mpd) &

# To get expose type effect
# simulate scroll_lock to activate skippy
xautolock -locker  "xte 'key Scroll_Lock'" -corners 0+00  -cornerdelay 1 &

# (sleep 2 &&  trayer --expand true --widthtype request --transparent true --alpha 255 --edge bottom --align right --SetDockType false) &
(sleep 10 && /home/hardik/bin/startSkippy.sh) &
