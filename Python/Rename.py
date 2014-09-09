#! /usr/bin/env python2
# -*- coding: utf-8 -*-

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Name:        Bit-Dust Renamer
# Description:     Rename all selected files following a pattern: filename (nº).ext.
#              	   For example: Photo (23).jpg
#
# Author:      Brian Mayo
# Contact:     brianmay.dev@gmail.com
# Created:     9/9/2014
# Copyleft:    2014
# Licence:     GNU GPL v3
#
# Requeriments:	Python 2.x
#				Gtk 2.x
#				Nautilus or a derivated file manager (Caja, Nemo)
# Installation: 
#       You must copy this file in /home/<user>/.local/share/nautilus/scripts and give it executation permissions.
#		For Caja or Nemo modify line 38: "NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" to "CAJA_SCRIPT_SELECTED_FILE_PATHS" or 
#		"NEMO_SCRIPT_SELECTED_FILE_PATHS"
#
# Usage:    
#		* Renaming Files: Right click on the selected files that you want to rename (you can include folders). Open the context menu
#                   	  and click in Scripts->Renamer. Simple window will be opened and write in it the new name for the files.
#		* Renaming Folder content: Right click on a folder, go to Scripts->Renamer.
#						  Simple window will be opened and write in it the new name for the folder files.
#		In both cases if you leave empty the text entry the files will be renamed with the parent folder name.
#		Press ESC to cancel.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

import os
import sys
import gtk

class Renamer:
	def rename(self,newName):
		# get the selected files paths. Assuming that the user call the script from contextual menu
		selected = os.environ.get("NAUTILUS_SCRIPT_SELECTED_FILE_PATHS").splitlines()

		# check if user want to rename all files of a directory
		fInDir = False
		if len(selected) == 1 and os.path.isdir(selected[0]):
			d = selected[0]
			dFiles = [os.path.join(d, f) for f in os.listdir(d)] # get files with absolute path
			dFiles = filter(lambda s: not s.startswith("."), dFiles) # filter hidden files
			# if has files inside
			if dFiles != []:
				selected = dFiles
				dName = os.path.split(d)[1]
				fInDir = True

		if not newName: 
			# the one selected dir name or the parent folder name
			newName = dName if fInDir else os.path.split(os.path.abspath(selected[0] + "/.."))[1]

		# main loop
		for f in selected:
			fExt = os.path.splitext(f)[1]
			fPath,fName = os.path.split(f)

			index = 1 # used for the name pattern (name (nº).ext). Count from 1 because the differents files and extensions
			while True:
				new = "%s/%s (%i)%s" % (fPath, newName, index, fExt)
				# the order of the condicional statements influences in renamed files count
				if new == f: break
				elif not os.path.exists(new): break

				index += 1

			if new == f: continue # file gots the same name, no need to rename it

			os.rename(f, new)

		selected, dFiles = None, None
		gtk.mainquit()
		
	def onKey_Release(self, widget, ev, data=None):
		if ev.keyval == 65307:
			# Esc pressed
			gtk.mainquit()
		if ev.keyval == 65293 or ev.keyval == 65421:
			self.win.hide()
			self.rename(self.entry.get_text())

	def __init__(self):
		msg = "Enter the new name.\nPress ENTER to rename files."
		if "es" in os.environ.get("LANG"):
			msg = "Ingresa el nuevo nombre.\nPresiona ENTER para renombrar los archivos."

		# create a window
		self.win = gtk.Window(gtk.WINDOW_TOPLEVEL)
		self.win.set_skip_taskbar_hint(True)
		self.win.set_resizable(False)
		self.win.set_position(gtk.WIN_POS_CENTER)
		self.win.move(self.win.get_position()[0],160)
		self.win.set_usize(336, 104)
		self.win.set_title("Bit-Dust Renamer")
		self.win.connect("delete_event", gtk.mainquit)

		hbox = gtk.HBox(True, 0)
		self.win.add(hbox)
		hbox.show()

		vbox = gtk.VBox(False, 4)
		hbox.pack_start(vbox, False,True, 8)
		vbox.show()

		label = gtk.Label(msg)
		vbox.pack_start(label, False, False, 10)
		label.show()

		self.entry = gtk.Entry(100)
		self.entry.set_width_chars(60)
		vbox.pack_start(self.entry, False, False, 0)
		self.entry.connect("key-release-event", self.onKey_Release)   
		self.entry.show()

		self.win.show()

	def main(self):
		gtk.main()

if __name__ == "__main__":
	ui = Renamer()
	ui.main()