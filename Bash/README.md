## Please read the instructions inside on each script.


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
    
## winmove-installer

Simple installer for **winmove.sh**. Execute with execution permissions.

## nw-run

Simple script to execute [Node Webkit](https://github.com/rogerwang/node-webkit) based apps.
Execute inside a terminal using "./nw-run" or make a link in /bin to execute anywhere. 
You can exclude folders and files from your nw package using the -x parameter, use *\file.ext* to exclude files and/or *\folder/** to exclude folders.
Separe the folders and files with a comma, for example: 
```
nw-run -x "\file.txt, \folder/*, \folder2/image.jpg"
```
nw-run will exclude *file.txt*, *folder* and *folder2/image.jpg* from your nw package.

> The nw-run script creates a folder inside node-webkit folder called *apps*. In this folder will be stored all your nw apps executed with this script. To clean the nw apps folder execute **nw-run -c**.

