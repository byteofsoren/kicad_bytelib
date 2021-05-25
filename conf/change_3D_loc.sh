#!/bin/bash

INPUTDIR="../"



find $INPUTDIR -type f -name '*.kicad_mod' | while read fname; do
	# sed -Ei 's/model :temp:(.+)/model "\$\{BYTELIB\}\/3D\/\1"/g' $fname
	grep "model" $fname
done
