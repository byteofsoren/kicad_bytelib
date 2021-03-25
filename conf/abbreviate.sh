#!/bin/bash


# -- Global config --
TEMPDIR="/tmp/bytelib"
# Setup
rm -rf $TEMPDIR
mkdir -p "$TEMPDIR"

# -- Function body start -- [[

# Generates the kicad library to contain the custom environments.
# Assume that a entry in the library contains a hard coded path
# as /home/user/.kicad/bytelib
# Then that path must be substituted with
# ${BYTELIB} alone to be able to work on other computers.
# This program replaces those hard coded paths in to
# environmental variables.
#
# Insert filename hardpath variable tempfile
#
# Arguments:
# - filename: The targeted fp-lib-table or sym-lib-table
# - hardpath: The hard coded path to the library.
# - variable: The intended substitution tex BYTELIB
# - tempfile: Writes the output to the temp file.
# 			  Note: the file is stored in $TEMDIR
function generate() {
	filename=$1
	hardpath=$2
	variable="\${$3}"
	tempfile=$TEMPDIR/$4
	# Number of files that has a fixed path
	fnr=$(cat $filename  | grep $hardpath | wc -l)
	# Sanitises the output an converts the / to \/ so it can be used by rexex
	if [[ -e $hardpath ]]; then
		sanetised=$(echo $hardpath | sed 's/\//\\\//g')
	else
		echo "Hardpath did not exist\nError: $hardpath"
		exit
	fi
	if [[ $fnr >  0 ]]; then
		echo -e "Work on  \e[32m$filename\e[39m to substitute  \e[32m$variable\e[39m"
		cat $1 | sed "s/$sanetised/$variable/g" > $tempfile
	# else
	# 	echo "---- There was nothing to update---- "
        # echo "filename = $filename"
        # echo "hardpath = $hardpath"
        # echo "variable = $variable"
        # echo "tempfile = $tempfile"
	fi
}

# Body
# Body captures the libraries that already have a environment variable
#
# body filename tempfile
#
# Arguments:
# - filename: The input file to scan for working wariables
# - tempfile: The output file stored here:
# 			  Note: the file is stored in $TEMDIR
function body() {
	filename=$1
	tempfile=$TEMPDIR/$2
	mkdir -p $TEMPDIR
	cat $filename |  grep "uri \\$.\w*.\\/" > $tempfile
}

# Merge
# Merge merges selected file in the $TEMPDIR directory with a
# temp file and also removes the merged file
#
# merge inputfile outputfile
#
# Arguments:
# - inputfile:  $TEMPDIR/inptufile
# - outputfile: $TEMPDIR/outputfile
function merge() {
	infile=$TEMPDIR/$1
	outfile=$TEMPDIR/$2
	if [[ -e $infile ]] && [[ -e $outfile ]]; then
		cat $infile >> $outfile
		rm -rf $infile
	elif [[ -e $infile ]] && [[ ! -e $outfile ]]  ; then
		mv $infile $outfile
	fi
}

# Apply
# The apply function asks if the changes should be applied to the libraryfile.
#
# apply tempfile taregtfile
#
# Arguments:
# - tempfile: 	Located in $TEMPDIR
# - targetfile: Located . and the target for over writing.
function apply() {
	tempfile=$TEMPDIR/$1
	targetfile=$2
	if [[ -e $tempfile ]] && [[ ! -e $targetfile ]]; then
		# The target did not exist write with out questioning
        echo "Target did not exist applying messures"
		mv $tempfile $targetfile
    elif [[ -e $tempfile ]] && [[ $(cat $tempfile | wc -l ) > 0 ]] && [[ -e $targetfile ]]; then
		# Target existed write after questioning
		# Prompt:
		echo -e "Overwrite: \t\e[32m$targetfile\e[39m"
		echo -e "With: \t\t\e[93m$tempfile\e[39m"
		read -p "Selet yN: " ans
		if [[ $ans == "y" ]] || [[ $ans == "Y" ]]; then
			echo "$tempfile -> $targetfile"
			mv $tempfile $targetfile
		fi
	fi
}

# clean
# just remove the temporary directories
function clean() {
    rm -rf $TEMPDIR
}

# -- Function body end -- ]]


# -- local settings --
symfile="sym-lib-table"
fpfile="fp-lib-table"
digikey_path="/home/r00tr4t/.kicad/digikey-kicad-library"
bytelib_kicad="/home/r00tr4t/.kicad/bytelib_kicad"

# -- Execution body -- [[

# For debugging purpose.
# fpnr=$(cat fp-lib-table | grep $digikey_path | wc -l)
# symnr=$(cat sym-lib-table | grep $digikey_path | wc -l)
# echo -e "hard footprints $fpnr\nhard symbols $symnr"

# Generate libarys
generate 	$symfile 			$digikey_path 		DIGKEY 		$symfile-digkey
generate 	$symfile 			$bytelib_kicad  	BYTELIB 	$symfile-bytelib
generate 	$fpfile 			$digikey_path 		DIGKEY 		$fpfile-digkey
generate 	$fpfile 			$bytelib_kicad  	BYTELIB 	$fpfile-bytelib
# Capture the body
body  		$symfile 			$symfile-body
body  		$fpfile 			$fpfile-body
# Merge the parts
merge 		$symfile-body       $symfile
merge 		$symfile-digkey  	$symfile
merge 		$symfile-bytelib 	$symfile
merge 		$fpfile-body        $fpfile
merge 		$fpfile-digkey  	$fpfile
merge 		$fpfile-bytelib 	$fpfile
# Apply the changes
apply $symfile $symfile
apply $fpfile $fpfile
# clean

# -- Execution body end -- ]]

