#!/bin/bash
#
# Programm: spiel.sh
# Aufruf: ./spiel.sh
#
# Das Skript spiel.sh ist ein Ratespiel. Spieler 1 gibt eine Zahl zwischen 1 und 100 an und Spieler 2 muss sie erraten.
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 18.12.2018

# globals
nurZahlen='^[0-9]+$'

# validation
if [[ -n $1 ]] ; then
    echo Richtige syntax: $0
else
    # Input
    read -p "Spieler 1, geben Sie eine Zahl zwischen 1 und 100 ein: " zahl

    # validation
    while (( $zahl > 100 )) || (( $zahl < 1 )) || ! [[ $zahl =~ $nurZahlen ]]
    do
        read -p "Falsche Eingabe. Geben Sie eine Zahl ein: " zahl
    done


fi
