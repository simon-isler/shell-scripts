#!/bin/bash
#
# Programm: tr.sh
# Aufruf: ./tr.sh file1.txt file2.txt
#
# Dieses Script ersetzt in der Datei File1 jedes Vorkommnis von Zeichen1 durch das Zeichen2 und schreibt das Ergebnis in die Datei File2.
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 26.11.2018

# Überprüfung, ob Dateien angegeben wurden
if [ -n "$1" ] && [ -n "$2" ]; then
   # Überprüfung, ob es file $1 gibt
   if [ -e $1 ]; then
	# $1 darf nicht gleich $2 sein
	if ! [ $1=$2 ]; then
    	# Eingabe
  		read -p 'Welches Zeichen soll ersetzt werden? ' zeichen1
  		read -p 'Durch welches Zeichen soll '$zeichen1' ersetzt werden? ' zeichen2

  		# Ausführung
  		sed "s/$zeichen1/$zeichen2/g" $1 > $2
	else
		echo $1 und $2 sind gleich!
	fi
   else
    	echo $1 existiert nicht!
   fi
else
  echo "Bitte geben Sie die Dateien an (./tr.sh file1.txt file2.txt)!"
fi