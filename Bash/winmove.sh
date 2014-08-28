#!/bin/bash
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Autor: Brian Mayo
# Contact: brianmay.dev@gmail.com
# Year: 2014
# Name: winmove
# Version: 1.0.1
# Prerequisites:
#       xrandr, 
#       xdotool -> http://www.semicomplete.com/projects/xdotool/
# Usage:
#   English:    This is a simple script that you can use to move the active window to differents parts of your screen.
#               The best way to use it is configuring a keyboard shortcut to execute the script, like <Super> + Left to move window to the left.
#               So when you want move the current window you only must press <Super> + Left and your window will be moved to the left in your screen.
#       
#               Setting up: first you must give executation permission. Then, according to your descktop enviroment and window manager, create a keyboard shortcut. #       For example, if you use Gnome 3.10 go to Settings->Keyboard->Shortcuts and add a new shortcut.
#               Name it like you want and in "command" write this "bash /path/to/this_script.sh <option>". 
#               For example: bash /home/brian/winmove.sh "left" to shortcut the move to left option.
#               (Please make shure that the path doesn't contains white spaces). 
#               Search on the web for your dekstop.
#               You're ready to use :)
# 
#   Español:    Este es un simple script con el que puedes mover la ventana activa hacia la derecha, izquierda o centro de tu pantalla.
#               La mejor manera de usarlo es configurando un atajo de teclado, por ejemplo <Super> + Izquierda.
#               Entonces, si tu quieres centrar la actual ventana solo debes presionar <Super> + Izquierda y tu ventana se moverá a la izquierda de tu pantalla.
#       
#               Configuración: primero debes darle permisos de ejecución al script. Luego, deacuerdo a tu entorno de escritorio y window manager,
#               debes crear un atajo de teclado.
#               Por ejemplo, si usas Gnome 3.10 como entorno dirígite a Configuraciones -> Teclado -> Atajos y añade un nuevo atajo.
#               Busca en internet sobre cómo debes crear atajos en tu escritorio.
#               Nómbralo como quieras y en "comando" escribe "bash /ruta/a/este-script.sh <opción>".
#               Por ejemplo: bash /home/brian/winmove.sh "left" para crear un atajo de mover a la ventana a la izquierda.
#               (Asegúrate que la ruta no posea espacios en blanco para evitar errores)
#               Estás listo para usarlo :)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# get the current screen resolution
sc_resol=( $(xrandr | grep '*' | grep -Eo '[0-9]{1,4}') ) # grep numbers with 1-4 digits
sc_width="${sc_resol[0]}"
sc_height="${sc_resol[1]}"

# get the active window size
win_geometry=( $(xdotool getwindowfocus getwindowgeometry --shell | egrep  'HEIGHT|WIDTH' | grep -Eo '[0-9]{1,4}') )
win_width="${win_geometry[0]}"
win_height="${win_geometry[1]}"

# get the active window id
winid=`xdotool getwindowfocus`

# center position respect the active window size
center_x=$((sc_width / 2 - win_width / 2))
center_y=$((sc_height / 2 - win_height / 2))

# the options are <lef|top-left|bottom-left|center|right|top-right|bottom-right>
case "$1" in
'left')
  xdotool windowmove $winid 0 $center_y
  xdotool windowsize $winid $(( $sc_width/2 )) $sc_height
;;
'right')
    xdotool windowmove $winid $(( $sc_width/2)) "$center_y"
    xdotool windowsize $winid $(( $sc_width/2)) $sc_height
;;
'top-left')
    xdotool windowmove $winid 0 0
    xdotool windowsize $winid $(( $sc_width/2 )) $(( $sc_height/2))
;;
'top-right')
    xdotool windowmove $winid $(( $sc_width/2))  0
    xdotool windowsize $winid $(( $sc_width/2 )) $(( $sc_height/2 ))
;;
'bottom-left')
    xdotool windowsize $winid $(( $sc_width/2 )) $(( $sc_height/2 ))
    xdotool windowmove $winid 0 $(( $sc_width/2 ))
;;
'bottom-right')
    xdotool windowmove $winid $(( $sc_width/2))  $(( $sc_height/2 ))
    xdotool windowsize $winid $(( $sc_width/2 )) $(( $sc_height/2 ))
;;
'center')
    xdotool windowmove $winid $center_x $center_y
;;
esac

exit
