#!/bin/bash

# Updates the files for kicad so that they use the BYTELIB env
ENV="uri \${BYTELIB}"
localpath="uri /home/r00tr4t/.kicad/bytelib_kicad"



# Sanitises the output an converts the / to \/ so it can be used by rexex
sanetised=$(echo $localpath | sed 's/\//\\\//g')
footprint="fp-lib-table" # handles the footprints in KiCAD
symbols="sym-lib-table"  # handles the symbols in kiCAD
# Create templife with the corrected symbols files
cat $symbols | sed "s/$sanetised/$ENV/g" > tempfile
if [[ $(cat tempfile | wc -l) > 0 ]]; then
	# move the tmpifle to the symbolssymbols  libary.
	mv tempfile $symbols
fi
# Create templife with the corrected footprints files
cat $footprint | sed "s/$sanetised/$ENV/g" > tempfile
if [[ $(cat tempfile | wc -l) > 0 ]]; then
	# move the tmpifle to the footprints libary.
	mv tempfile $footprint
fi


