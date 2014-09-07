#!/bin/bash

########################################################################
# Autor: Brian Mayo
# Version: 1.0.0
# Description: This script allows to execute Node Webkit based apps easily zipping your app and moving it to apps folder in node webkit folder.
# Usage: For using this script you must set up the variable "nw_path" with the full path to node webkit folder.
#		 The node webkit folder must not contains white spaces.
#		 Put this script in the root folder of the app and execute it (same folder as package.json).
#
# This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
###########################################################################

old=$IFS
IFS=$'\n'

nw_path="/home/brian/Programs/nw" # set up this. Ex /home/node-webkit
nw_apps_path="$nw_path/apps"

if [[ ! -d "$nw_apps_path" ]]; then
	mkdir "$nw_apps_path" # nw apps folder
fi

app_name="${PWD##*/}.nw"
app_nw="$nw_apps_path/$app_name"

zip -q -r "$app_name" .  -x \*.sh

if [[ -f "$app_nw" ]]; then
	rm "$app_nw"
fi

mv "$app_name" "$app_nw"
cd "$nw_path"

./nw "apps/$app_name"

IFS=$old

exit