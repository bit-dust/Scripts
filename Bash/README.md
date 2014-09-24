## Please read the instructions inside on each script.


## Renamer

Is the Bash version of [Rename](https://github.com/bit-dust/Scripts/blob/master/Python/Rename)

#### Requeriments
	xdotool
	xrandr

## nw-run

Simple script to execute [Node Webkit](https://github.com/rogerwang/node-webkit) based apps.
#### Usage:
First set up the variable "nw_path" with the full path to node webkit folder. The node-webkit folder must not have white spaces.
Copy the script to your app folder and execute inside a terminal using `./nw-run`. You can make a link in /bin to execute anywhere, open in a terminal your app folder - where is the **package.json** file - (example: `cd /node-webkit/app-folder`) and run `nw-run`. 
You can exclude folders and files from your nw package using the -x parameter, use *\file.ext* to exclude files and/or *\folder/** to exclude folders.
Separe the folders and files with a comma, for example: 
```
nw-run -x "\file.txt, \folder/*, \folder2/image.jpg"
```
nw-run will exclude *file.txt*, *folder* and *folder2/image.jpg* from your nw package.

#### Requeriments
	zip
	node-webkit 

> The nw-run script creates a folder inside node-webkit folder called **apps**. In this folder will be stored all your nw apps executed with this script. To clean the nw apps folder execute `nw-run -c`.


## winmove

Is a simple script to manage window positions using keyboard shortcuts.
You can set the keyboard shortcuts like:

| Move action | Shortcut  |
| ----------- | --------  |
| left        | Super + 4 |
| top-left    | Super + 7 |
| bottom-left | Super + 1 |
| right       | Super + 6 |
| top-right   | Super + 9 |
| bottom-right| Super + 3 |
| center      | Super + 5 |
    
#### Requeriments
	xdotool
	xrandr

## winmove-installer

Simple installer for **winmove.sh**. Execute with execution permissions.
