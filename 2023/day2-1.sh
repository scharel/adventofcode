#!/bin/bash
#
# https://adventofcode.com/2023/day/2 part 1

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

sum=0
while read line; do
    impossible=false
    game=$(echo $line | awk -F':' '{ print $1 }' | awk '{ print $2 }')
    record=$(echo $line | awk -F': ' '{ print $2 }' | sed 's/; /\n/g')
    #echo "Game $game:"
    while read set; do
        #echo "- $set"
        draws=$(echo $set | sed 's/, /\n/g')
        while read cube; do
            num=$(echo $cube | awk '{ print $1 }')
            color=$(echo $cube | awk '{ print $2 }')
            case $color in
                red)
                    cmax=12
                    ;;
                green)
                    cmax=13
                    ;;
                blue)
                    cmax=14
                    ;;
            esac
            if [ "$num" -gt "$cmax" ]; then
                impossible=true
                #echo "Impossible $line"
                break
            fi
        done <<< $draws
        if [ "$impossible" = true ]; then
            break
        fi
    done <<< $record
    if [ "$impossible" = false ]; then
        sum=$(($sum+$game))
    fi
done < $1

echo $sum

exit 0
