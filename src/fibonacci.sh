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
syntax="./fibonacci.sh zahl"
nurZahlen='^[0-9]+$'
a=1
b=0

# validation
if [[ -n $1 ]] ; then
    echo Richtiger Syntax: $syntax
    echo "Das Script fibonacci.sh, fragt nach einer Zahl berechnet und dann die entsprechenden Fibonacci-Zahlen (bei Eingabe von zB. 20 werden die ersten zwanzig Fibonacci-Zahlen ausgegeben)."
else
    read -p "Geben Sie eine Zahl ein: " zahl

    while ! [[ $zahl =~ $nurZahlen ]]
    do
        read -p "Geben Sie eine Zahl ein: " zahl
    done

    # if it is a number
    if [[ $zahl =~ $nurZahlen ]]; then
        # calculate
        while (( $zahl > 0 ))
        do
            temp=$a
            a=$(($a+$b))
            b=$temp
            zahl=$((zahl-1))

            # output
            echo $zahl": " $b
        done
    fi
fi