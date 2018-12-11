#!/bin/bash
#
# Programm: fakultaet.sh
# Aufruf: ./fakultaet.sh x
#
# Dieses Skript berechnet von einer als Parameter eingegebenen Zahl die Fakultät.
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 11.12.2018

# globals
fakultaet=1
zahlen='^[0-9]+$'
syntax="$0 positiveZahl"

# validation
if [[ -n $1 ]]; then
    if [ $1 = -h -o $1 = -help ] ; then
		echo "$0 berechnet von einer als Parameter eingegebenen Zahl die Fakultät."
		echo "Richtiger Syntax: " $syntax

	# accept only numbers
	elif [[ $1 =~ $zahlen ]]; then
	     # number too big
        if [[ $1 > 59 ]]; then
            echo Die Zahl ist zu gross!
            exit 2
        else
            # calculate
            for k in $(seq 1 $1)
            do
                fakultaet=$[$k * $fakultaet]
            done

            # output
            echo Die Fakultät von $1 ist $fakultaet
        fi
    else
        # error
        echo Es sind ausschliesslich positive Zahlen von 0-59 erlaubt!
        exit 1
	fi

else
    # error
    echo Es wurde keine Zahl angegbeen.
    exit 1
fi
