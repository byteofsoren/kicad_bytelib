#!/bin/bash

# Updates the files for kicad so that they use the BYTELIB env
ENV="uri \${BYTELIB}"
echo $ENV
localpath="uri /home/r00tr4t/.kicad/bytelib_kicad"
sanetised=$(echo $localpath | sed 's/\//\\\//g')
#uri \/home\/r00tr4t\/.kicad\/bytelib_kicad
echo $sanetised
footprint="fp-lib-table"
symbols="sym-lib-table"
# cat $symbols | sed -e "s/uri $localpath/uri \$\($ENV\)/g"
# cat sym-lib-table | sed 's//uri ${BYTELIB}/g'
cat $footprint | sed "s/$sanetised/$ENV/g"
cat $symbols | sed "s/$sanetised/$ENV/g"

