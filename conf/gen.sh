#!/bin/bash

libtab_path="$HOME/.config/kicad/"

# Generates an update file to be used with kicad
function libupdate() {
    target=$1
    keyword=$2
    libtab="$libtab_path/$target"
    if [[ -e $libtab ]]; then
        cat $libtab | grep "$keyword" > "$target.update"
        echo "DONE"
    else
        echo "Fille not found"
    fi
}
libupdate fp-lib-table BYTELIB
libupdate sym-lib-table BYTELIB
libupdate fp-lib-table DIGKEY
libupdate sym-lib-table DIGKEY
