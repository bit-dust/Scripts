## Please read the instructions inside on each script.

## Rename

Is a simple script for Nautilus that renames files and folders following a pattern: filename (nº).ext.
For example: **Photo (23).jpg**
The script use a Gtk window.

#### Requeriments:	
	Python 2.x
	Nautilus or a derivated file manager (Caja, Nemo)

#### Installation: 
Copy this file in **/home/user/.local/share/nautilus/scripts** and give it executation permissions.
For Caja or Nemo modify: 
`NAUTILUS_SCRIPT_SELECTED_FILE_PATHS` to `CAJA_SCRIPT_SELECTED_FILE_PATHS` or 
`NEMO_SCRIPT_SELECTED_FILE_PATHS`
You can name the script as you want.

#### Usage:    
* Renaming Files: 
Right click on the selected files that you want to rename (you can include folders). Open the context menu
and click in **Scripts->Renamer**. Simple window will be opened and write in it the new name for the files.
* Renaming Folder content: 
Right click on a folder, go to Scripts->Renamer.
Simple window will be opened and write in it the new name for the folder files.
* In both cases if you leave empty the text entry the files will be renamed with the parent folder name.
* Press ESC to cancel.

## RenameUI

Is a simple Gtk interface for Rename script.

#### Requeriments:	
	Python 2.x
	Gtk 2.x
	Nautilus or a derivated file manager (Caja, Nemo)
**Installation and Usage are the same as Rename script.**

