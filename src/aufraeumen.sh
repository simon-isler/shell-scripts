#!/bin/bash
#
# Programm: aufraeumen.sh
# Aufruf: ./aufraeumen.sh x
#
# Das Script aufraeumen.sh, verschiebt alle Shell-Scripts in dem Home-Verzeichnis (inkl. Unterverzeichnissen) in das Verzeichnis $HOME/scripts und - falls nötig - wird es ausführbar gemacht. Das Verzeichnis scripts wird erstellt, falls es nicht existiert.
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 11.12.2018

# globals
befehl=$0
count=0

# no arugment
if [[ $# -eq 0 ]]; then
	    # create directory if not exists
        mkdir -p $HOME/scripts

        # check all files excluding /script directory
        for file in $(find $HOME -maxdepth 2 -type f ! -path '*/scripts/*'); do
            if [[ $file == *.sh ]]; then
                # count found files
                (( count++ ))

                # file is not executable
                if [[ ! -x $file ]]; then
                    chmod +x $file
                fi

                # move file
                mv $file $HOME/scripts/
            fi
        done

        # help argument
        elif [[ $1 = -h || $1 = -help ]] ; then
		    echo "$0 verschiebt alle Shell-Scripts in dem Home-Verzeichnis (inkl. Unterverzeichnissen) in das Verzeichnis $HOME/scripts und - falls nötig - wird es ausführbar gemacht. Das Verzeichnis scripts wird erstellt, falls es nicht existiert."
		    echo "Richtiger Syntax: " $befehl
		    count=1

		# has an argument
		else
		    echo "Richtiger Syntax: " $befehl
		    count=1
fi

# no scripts found
if [[ $count == 0 ]]; then
   echo Es gibt keine Scripts!
fi