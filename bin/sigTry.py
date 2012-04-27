#!/usr/bin/env python

import signal

def func(signum,frame):
    print "Signal " + str(signum) + " cought"


signal.signal(signal.SIGTERM,func)

while(True):
    pass

