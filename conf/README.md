# Settings and library updating for kicad
In this README file the documentation for how to use the script in this directory and an explanation of each file available for this library.

# TOC



# File strurture
```
fp-lib-table            # Footprint table
fp-lib-table.update     # The update footprint table
sym-lib-table           # Symbols table
sym-lib-table.update    # The updates for symbols
getupdate.sh            # getupdate script #getupdate.sh
abbreviate.sh           # Abbreviate script #abbreviate.sh
README.md               # This file
```

# abbreviate.sh
The abbreviate script shortens paths to use a variable instead of the full paths.
## Internal functions
The interal of the script is splitted up in these parts:
1. generate
2. body
3. merge
4. apply
These parts is applyied in that other to abbreviate the paths to the variables.
For more information read the internal documentation.
## Internal structure
The structure of the code is also divided up in several parts to specify both
the order of exequiton and increase the redability of the code.
``` BASH
# -- Global config --
# -- Function body start -- [[
# -- Function body end -- ]]
# -- local settings --
# -- Execution body -- [[
# -- Execution body end -- ]]
```

1. Global config
This part contains variabes shared between each function in the function body
2. Function body
This part contains all functions used in the exequiton body.
3. local settings
This is abbreviatations in the exequiton body.
4. Execution body
This part uses the functions from the function body to abbreviate the hard paths in each KiCAD file.


# getupdate.sh
This script is used to generate a short version of the symbols and footprint files.
## Internal structure
As this file just have a sigle function the structure of the file is a simpler.
1. Global config
Global configuration is shared between functions even if there is just one function.
The part:
``` BASH
declare -a LIBARIES=("BYTELIB" "DIGKEY" )
```
Declares a variable named `LIBARIES` that contains two entitys.
Those are the filter that is used in the `generate` function to generate the update file.
2. Initial setup
Some initial cleaning and temporary directory creation.
3. function `generate`
Uses the `LIBARIES` variable to extract those who match the
4. Execution part
Uses the `generate` function on the two KiCAD files to generate a update file.



