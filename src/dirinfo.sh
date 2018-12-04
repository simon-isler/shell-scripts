#!/bin/bash
#
# Programm: dirinfo.sh
# Aufruf: ./dirinfo.sh relative_path
#
# Skript, welches für ein angegebenes relatives Verzeichnis die Anzahl Unterverzeichnisse und Dateien sowie der benötigte Festplattenspeicher ausgibt.
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 27.11.2018

# Überprüfung, ob Pfad angegeben wurde
if [ -n "$1" ]; then
	# Pfad
	pfad="$(cd "$(dirname "$1")"; pwd)"

	# Unterverzeichnisse
	sub=$(ls -l $pfad | grep -c ^d)

	# Dateien
	f=$(ls -l $pfad | egrep -c '^-')

	# Speicher
	s=$(du -sh 2>/dev/null | cut -f1)B

	# Ausgabe
	echo Info zu $1:
	echo $sub Unterverzeichnisse
	echo $f Dateien
	echo $1 benötigt $s Festplattenspeicher
else
	echo Es wurde kein Verzeichnis angegeben!
fi



