#!/usr/bin/env python

import sys,operator

if (len(sys.argv) != 2):
    print( "Usage: " + sys.argv[0] + " <filepath>")
    exit()

fileName = sys.argv[1]

fIn = open(fileName,'r')

numDict = {}

for line in fIn:
    key = line.strip()
    if numDict.has_key(key):
        numDict[key] = numDict[key] + 1
    else:
        numDict[key] = 1

sortedList = sorted(numDict.items(), key = operator.itemgetter(1), reverse = True)
for i in range(0,5):
    print "%s is %s times" % (sortedList[i][0], sortedList[i][1])





