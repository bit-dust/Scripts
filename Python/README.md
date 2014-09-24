## Rename

Is a simple script for Nautilus that renames files and folders following a pattern: filename (nº).ext.
For example: **Photo (23).jpg**

![](https://raw.githubusercontent.com/bit-dust/Scripts/master/Python/Screenshots/Rename.png)

#### Requeriments:	
	xdotool
	xrandr
	Python 2.x
	Nautilus or a derivated file manager (Caja, Nemo)
	Gnome Terminal (or Konsole or Mate Terminal or XTerm)

#### Installation: 
Copy the scrip in **/home/user/.local/share/nautilus/scripts** and give it execution permissions.
The path must not have white spaces.
For Caja or Nemo modify: 
`NAUTILUS_SCRIPT_SELECTED_FILE_PATHS` to `CAJA_SCRIPT_SELECTED_FILE_PATHS` or 
`NEMO_SCRIPT_SELECTED_FILE_PATHS`. You can name the script as you want.

#### Usage:    
* __Renaming Files:__
Right click on the selected files that you want rename (you can include folders). Open the context menu
and click in **Scripts->Rename**.
* __Renaming Folder content:__ 
Right click on a folder, go to **Scripts->Renamer**. All files in the selected folder will be renamed except hidden files.
* In both cases if you __leave empty__ the text entry the files will be renamed with the parent folder name.
* Press __ESC__ to __cancel__.

## RenameUI

Is a simple Gtk interface for Rename script.

![](https://raw.githubusercontent.com/bit-dust/Scripts/master/Python/Screenshots/RenameUI.png)


#### Requeriments:	
	Python 2.x
	Gtk 2.x
	Nautilus or a derivated file manager (Caja, Nemo)
**Installation and Usage are the same as Rename script. Note that the interface style depends of your gnome-shell theme.**

