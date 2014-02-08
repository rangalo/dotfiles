#!/bin/bash

# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

. $GLOBALAUTOSTART

xset -b
# key mapping for multimedia keys

# numlockx on

# Load setting for xterm , aterm etc 
xrdb -load /home/hardik/.Xdefaults &

# xmodmap /home/hardik/.Xmodmap &

# volwheel &

xscreensaver  -no-splash &
(sleep 1 && /usr/bin/yeahconsole ) &
# gkrellm -w &
# mpd --kill &
# mpd &

# (adesklets  -k &&  adesklets) &
# idesk&

# (sleep 3 && pypanel) &
(sleep 3 && tint2) &
(sleep 2 && /usr/bin/visibility) &


# wallpaper
eval `cat $HOME/.fehbg` &


(sleep 8 && conky) &
# (sleep 2 && conky -c /home/hardik/.conkyrc_mpd) &

# TODO: delte the following lines  related to skippy
# To get expose type effect
# simulate scroll_lock to activate skippy
# xautolock -locker  "xte 'key Scroll_Lock'" -corners 0+00  -cornerdelay 1 &

# (sleep 2 &&  trayer --expand true --widthtype request --transparent true --alpha 255 --edge bottom --align right --SetDockType false) &
# (sleep 10 && /home/hardik/bin/startSkippy.sh) &
