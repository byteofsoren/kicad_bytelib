#!/bin/bash

INPUTDIR="../"

# Search strings
SERCHFTS=( "step" "stl" "vrl" "stp")
SEARCHSTR="temp:"

# Find all files containing
# └──> find .. -type f -name '*.kicad_mod' | while read fname; do cat "$fname" | grep 'temp' ; done
find $INPUTDIR -type f -name '*.kicad_mod' | while read fname; do
    cat $fname | grep $SEARCHSTR
done

