#!/bin/bash
source="$HOME/.config/kicad/fp-lib-table"
target="fp-lib-table.update"
keyword="BYTELIB"
if [[ -e $source ]]; then
    cat $source | grep "$keyword" > $target
    echo "DONE"
else
    echo "Fille not found"
fi
