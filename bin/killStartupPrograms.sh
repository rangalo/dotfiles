#!/bin/bash

# conky
ps -eaf | grep conky | awk '{ print $2; }' | xargs kill -9

# dzen
ps -eaf | grep dzen | awk '{ print $2; }' | xargs kill -9

# yeahconsole
ps -eaf | grep yeahconsole | awk '{ print $2; }' | xargs kill -9
