#!/bin/bash
#
# Programm: rechner.sh
# Aufruf: ./rechner.sh
#
# Dieses Script fordert zur Eingabe von zwei Zahlen und berechnet dann die Summe, die Differenz, das Produkt, den Quotienten und den Modulo.
#
# Autor: Simon Isler
# Version: 1.0
# Datum: 26.11.2018

# Eingabe
read -p 'Geben Sie die 1. Zahl ein: ' zahl1
read -p 'Geben Sie die 2. Zahl ein: ' zahl2

# Ausgabe
echo 'Summe: ' $(($zahl1+$zahl2))
echo 'Differenz: ' $(($zahl1-$zahl2))
echo 'Produkt: ' $(($zahl1*$zahl2))
echo 'Quotient: ' $(($zahl1/$zahl2))
echo 'Modulo: ' $(($zahl1%$zahl2))