#!/bin/bash
#
# Programm: info.sh
# Aufruf: ./info.sh Datei (Datei2)
#
# Skript für die Ausgabe der Zugriffsrechte auf die Datei in Form dreier Oktalzahlen (z.B. 754)
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 04.12.2018

# Global
befehl="$0 Datei (Datei2)"

# Zugriffsrechte einer Datei in Oktalzahl umrechnen
function calcPermOctal {
     # support linux-gnu & darwin
	    if [[ "$OSTYPE" == "linux-gnu" ]]; then
            stat -c %a $1
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            stat -f %A $1
        else
            echo "Ihre Linux-Version wird nicht unterstüzt!"
        fi
}

# keine Argumente
if [ $# -eq 0 ] ; then
	echo $befehl
	exit 1
fi

# ein Argument
if [ $# -eq 1 ] ; then
	# Argument = help
	if [ $1 = -h -o $1 = -help ] ; then
		echo "$0 gibt die Zugriffsrechte auf die angegebene Datei in Form dreier Oktalzahlen (z.B. 754) aus."
		echo "Richtiger Syntax: " $befehl
	# Datei nicht vorhanden
	elif [ ! -e $1 ] ; then
		echo $1 existiert nicht
		exit 2
	else
	    calcPermOctal
	fi
	exit 0
fi

# zwei Argumente
if [ $# -eq 2 ] ; then
	# 1. Argument ist keine Datei
	if [ ! -e $1 ] ; then
		echo $1 existiert nicht
		exit 2
	# 2. Datei bzw. Argument existiert
	elif [ -e $2 ] ; then
		read -p "Möchten Sie die bestehende Datei überschreiben? (0), den Output an die bestehende Datei anhängen? (1) oder abbrechen? (3)" action
			case $antwort in
			1) cat $1 > $2; echo "Die Datei wurde überschrieben.";;
			2) cat $1 >> $2; echo "Die Datei wurde angehängt.";;
			*) echo "Abgebrochen!";;
			esac
		exit 0

	# Zugriffsrechte ausgeben
	else
		calcPermOctal
	fi
	exit 0
fi

# zu viele Argumente
if [ $# -gt 2 ] ; then
	echo "Es wurden zu viele Argumente angegeben!";
	echo "Richtiger Syntax: " $befehl
	exit 3
fi