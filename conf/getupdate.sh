#!/bin/bash

# Global config
TEMPDIR="/tmp/bytelib"
declare -a LIBARIES=("BYTELIB" "DIGKEY" )

# Setup
rm -rf $TEMPDIR
mkdir -p $TEMPDIR

function generate() {
	reg=$(echo ${LIBARIES[@]} | sed 's/\s/\\|/g')
	grep $reg $1 > "$1.update"

}
# Input files
symfile="sym-lib-table"
fpfile="fp-lib-table"
generate $symfile
generate $fpfile

