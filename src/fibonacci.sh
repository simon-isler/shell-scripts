#!/bin/bash
#
# Programm: fibonacci.sh
# Aufruf: ./fibonacci.sh zahl
#
# Das Script fibonacci.sh, fragt nach einer Zahl berechnet und dann die entsprechenden Fibonacci-Zahlen (bei Eingabe von zB. 20 werden die ersten zwanzig Fibonacci-Zahlen ausgegeben).
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 18.12.2018

#globals
nurZahlen='^[0-9]+$'
a=1
b=0
count=0
isValid=true

# validation
if [[ -n $1 ]] ; then
    echo Richtige Syntax: $0
    echo "Das Script fibonacci.sh, fragt nach einer Zahl berechnet und dann die entsprechenden Fibonacci-Zahlen (bei Eingabe von zB. 20 werden die ersten zwanzig Fibonacci-Zahlen ausgegeben)."
else
    read -p "Geben Sie eine Zahl ein: " zahl

    # validation
    while (( $zahl < 1 )) || (( $zahl > 93 )) || ! [[ $zahl =~ $nurZahlen ]]
    do
        read -p "Falsche Eingabe. Geben Sie eine Zahl ein: " zahl
        isValid=false
    done

    # if it is a number
    if (( $isValid == "true" )); then
        # calculate
        while (( $zahl > 0 ))
        do
            temp=$a
            a=$(($a+$b))
            b=$temp
            zahl=$((zahl-1))

            # count
            (( count++ ))

            # output
            echo "N"$count":" $b
        done
    fi
fi
