#!/bin/bash
#
# Programm: fakultaet.sh
# Aufruf: ./fakultaet.sh x
#
# Beschreibung
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 11.12.2018

fakultaet=1

# calculation
if [ -n "$1" ]; then
    for k in $(seq 1 $1)
        do
        fakultaet=$[$k * $fakultaet]
    done

    # output
    echo Die Fakultät von $1 ist $fakultaet
else
    echo Es wurde keine Zahl angegeben!
fi