#!/bin/bash

# parser.sh <archivo> <delimitador> [columna=1]

COLUMN=${3:-1} # Asigna valor predeterminado a la columna, siendo que es un parámetro opcional

cut -d $2 -f $COLUMN $1| tr -d ["aeiou"]

