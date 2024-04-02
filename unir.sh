#!/bin/bash

INDEX=0

if [ $1 == '-o' ]; then # Checks for the -o flag

    if [ -d $2 ]; then # Checks if the file already exists, to delete it.
        rm $2 # Deletes the file, if found
    fi

    touch $2 # Creates the directory (Could simply wait until >> but it's better to have failsafes)

    for i in $@; do # Loop to add file contents
        let "INDEX=INDEX+1" # Since the 'index' is already used for the granted files
        if [ $INDEX -gt 2 ]; then # Waits until the flag and the target file are out of the loop
            if [ -f $i ]; then # Checks if the granted parameters actually exist
                cat $i >> $2 # Outputs the file contents into target
                echo >> $2 # Creates a new line in target
            else
                echo "One of your parameters is not a file, or doesn't exist" # In case the user made a mistake
            fi
        fi
    done

else
    for i in $@; do
        if [ -f $i ]; then
            echo `cat $i` 
        else
            echo "One of your parameters is not a file, or doesn't exist" # In case the user made a mistake
        fi
    done
fi
