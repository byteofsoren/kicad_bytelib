#!/bin/bash

libtab_path="$HOME/.config/kicad/"

function libupdate() {
    target=$1
    keyword="BYTELIB"
    libtab="$libtab_path/$target"
    if [[ -e $libtab ]]; then
        cat $libtab | grep "$keyword" > "$target.update"
        echo "DONE"
    else
        echo "Fille not found"
    fi
}
libupdate fp-lib-table
libupdate sym-lib-table
