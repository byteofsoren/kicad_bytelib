# ByteLIB for KiCAD
My global libraries used in my KiCAD projects.
Note: A few how to at the bottom of this file how to do things correctly.
1. Clone this project.
``` BASH
$ git clone https://github.com/byteofsoren/kicad_bytelib.git
```
2. Write down the full path to the library.
3. Add 'BYTELIB' path to KiCad and target the cloned path
4. Update the 'fp-lib-table' by adding 'conf/fp-lib-table.update' to the end of the file.

## How to find fp-lib-table
1. Start KiCAD.
2. In Preferences -> Manage symbol libraries...
3. Tab: Global libraries
4. The first row has a tag file: there are your 'fp-lib-table'.
5. Add the text above to that file.

## How to define BYTELIB
1. Start KiCAD.
2. In Preferences -> Configure Paths...
3. Add BYTELIB and point it to the target

## A other approach to ft-lib-table
A other approach is to symlink your `ft-lib-table` over to this repo.
The drawback of that is you connect your globals to my globals and if I update the libary
you to will have a updated libary.

