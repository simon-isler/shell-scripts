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
isValid=true
versuche=1

# validation
if [[ -n $1 ]] ; then
    echo Richtige syntax: $0
else
    # input
    read -p "Spieler 1, geben Sie eine Zahl zwischen 1 und 100 ein: " zahl

    # input validation
    while (( $zahl > 100 )) || (( $zahl < 1 )) || ! [[ $zahl =~ $nurZahlen ]]
    do
        read -p "Falsche Eingabe. Geben Sie eine Zahl ein: " zahl
        isValid=false
    done

    # guessing
    if (( $isValid == "true" )); then
        read -p "Spieler 2, geben Sie ihren Tipp ein: " guess

        while ! (( $zahl == $guess ))
        do
            if (( $zahl > $guess )); then
                read -p "Zu tief! Spieler 2, geben Sie ihren Tipp ein: " guess
                (( versuche++ ))
            else
                read -p "Zu hoch! Spieler 2, geben Sie ihren Tipp ein: " guess
                 (( versuche++ ))
            fi
        done

        # correct
        if (( $zahl == $guess )); then
            if (( $versuche == 1 )); then
                echo "Wow! Sie haben es erraten mit einem Versuch!"
            else
                echo "Wow! Sie haben es erraten mit $versuche Versuchen!"
            fi
        fi
    fi
fi
