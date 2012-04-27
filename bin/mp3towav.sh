#!/bin/bash

MPGCMD=`which mpg123`
help() {
    echo "Usage: $0 <mp3dir> <wavdir>"
    exit
}

if [[ $# != 2 ]];  then
    help;
fi
if [[ ! -e $1 ]]; then
    echo "Input directory not present!"
    exit
fi

if [[ ! -e $2 ]]; then
    echo "Output directory not present!"
    exit
fi

for file in $1/*.mp3
do
    infile=$file;
    fName=`basename $file`
    outfile=$2/${fName%.mp3}.wav

    # echo "In: $infile Out: $outfile"
    $MPGCMD -w $outfile  $infile
    if [[ $? != 0 ]]; then
        echo "Could not convert file: $infile to $outfile"
    fi
done

