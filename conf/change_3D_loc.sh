#!/bin/bash

INPUTDIR="../"

# Search strings
SERCHFTS=( "step" "stl" "vrl" "stp")
SEARCHSTR="model :temp:"
REPLACESTR="model :$(BYTELIB)/3D/"

# Find all files containing
# └──> find .. -type f -name '*.kicad_mod' | while read fname; do cat "$fname" | grep 'temp' ; done

find $INPUTDIR -type f -name '*.kicad_mod' | while read fname; do
	echo $fname
	cat $fname | grep "$SEARCHSTR"
	sed -i "s/$SEARCHSTR/$REPLACESTR/" $fname
done
