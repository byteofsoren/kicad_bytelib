# ByteLIB for KiCAD
My global libraries used in my KiCAD projects.
Note: A few how to at the bottom of this file how to do things correctly.
1. Clone this project.
``` BASH
$ git clone https://github.com/byteofsoren/kicad_bytelib.git
```
2. Write down the full path to the library.
3. Add 'BYTELIB' path to KiCad and target the cloned path
4. Open your local `fp-lib-table` stored in ether `$HOME/.conf/kicad` or `Appdata/Roaming/kicad`
NOTE: `conf/fp-lib-table` is not your local `fp-lib-table`

## How to find fp-lib-table and sym-lib-table
1. Start KiCAD.
2. In Preferences -> Manage footprint libraries...
3. Tab: Global libraries
4. The first row has a tag file: there are your `fp-lib-table`.
5. Add the text above to that file.


For symbols..
1. In Preferences -> Manage symbol libraries...
2. The first row has a tag file: there are your `sym-lib-table`.

## How to define BYTELIB
1. Start KiCAD.
2. In Preferences -> Configure Paths...
3. Add BYTELIB and point it to the target

## A other approach to ft-lib-table and sym-lib-table
A other approach is to symlink your `ft-lib-table/sym-lib-table` over to this repo.
The drawback of that is you connect your globals to my globals and if I update the libary
you to will have a updated libary.

