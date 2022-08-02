# XML2-Ultimate-Patch
This is the project space for the X-Men Legends II Ultimate Patch (X2UP)

All characters, maps, menus, etc are separated out into their own individual folders. They are inter-linked by update scripts that pull files from character folders and add them to the necessary places. 

To compile, you must have `fbbuilder.exe` installed in `C:\Windows`. You must also have Python 3.8 or later and Raven-Formats installed.
Compilation is done by running `globalCompile.bat` in the root folder. It will give options for consoles and cel shading. Choose what is appropriate. 

Credits:
- ak2yny: Original batch files (including raven-formats compiler, fbextractor, and fbbuilder), batch file knowledge
- nikita488: Raven-Formats
- NorrinRadd: fbExtractor, fbBuilder original programs
