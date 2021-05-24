#!/bin/bash

# ========================================
# | Copy 3D files in to repo BASH script |
# ========================================
# | Written by: Magnus Sörensen          |
# | byteofsoren@gmail.com                |
# | license: GPLV3                       |
# ========================================
# | How to use:                          |
# | The variable $TEMP decides on the    |
# | input folder for the 3D files        |
# | The $TARGET is the target directory  |
# | for all 3D files                     |
# ========================================

# Change this
TEMP="$HOME/tmp/imports/"
TARGET="3D/"

# File types to search for is here:
FTYPE=( "STEP" "step" "vrml" "stp"  "wrl" "stl" )


# Variable derived form temp to escape each / with a \/.
LOCAL=$(echo $TEMP | sed -e 's/\//\\\//g')

# Does $TEMP exists?
if [[ -d $TEMP ]]; then
    echo "Working on the [$TEMP] dir."

    # YEs then search for each filetype in $FTYPE
    for ft in ${FTYPE[@]}; do
        echo "---- $ft ----"
        # Search with find in a while loop.
        find $TEMP -type f -name "*.$ft" | while read fname; do

            # Create a local path
            # i.e 3D/usb_c.stl
            loc=$(echo $fname | sed -e "s/$LOCAL//g")
            loctarget=$TARGET$loc

            # Check if the local target exists:
            if [[ ! -f "$loctarget" ]]; then
                # If not then create and copy the file
                mkdir -p $(dirname $loctarget)
                cp "$fname" "$loctarget"
            else
                # If yes check if it is the same content of the file.
                if ! diff -s "$fname" "$loctarget" > /dev/null
                then
                    # If so then the file exists and has the same content
                    # if the file name is the same and the content is the same
                    # then skip the file, i.e no copy needed.
                    echo "Same file new content skipping"
                    echo "Rename $fname"
                fi
            fi
        done
    done
fi
