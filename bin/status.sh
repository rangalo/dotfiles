#!/bin/bash

function fdate() {
    DATE_FORMAT='%A, %d.%m.%Y %H:%M:%S'
    date +"$DATE_FORMAT"
}

DATE_INTERVAL=1

DATE_COUNTER=1

while true
do
    if [ $DATE_COUNTER -ge $DATE_INTERVAL ]; then
        PDATE=`fdate`
        DATE_COUNTER=0
    fi
    echo $PDATE
    DATE_COUNTER=$(($DATE_COUNTER+1))
done
