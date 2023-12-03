#!/bin/bash
#
# https://adventofcode.com/2023/day/2 part 2

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

sum=0
while read line; do
    game=$(echo $line | awk -F':' '{ print $1 }' | awk '{ print $2 }')
    record=$(echo $line | awk -F': ' '{ print $2 }' | sed 's/; /\n/g')

    min_red=0
    min_green=0
    min_blue=0
    #echo "Game $game:"
    while read set; do
        #echo "- $set"
        draws=$(echo $set | sed 's/, /\n/g')
        while read cube; do
            num=$(echo $cube | awk '{ print $1 }')
            color=$(echo $cube | awk '{ print $2 }')
            case $color in
                red)
                    if [ "$num" -gt "$min_red" ]; then
                        min_red=$num
                    fi
                    ;;
                green)
                    if [ "$num" -gt "$min_green" ]; then
                        min_green=$num
                    fi
                    ;;
                blue)
                    if [ "$num" -gt "$min_blue" ]; then
                        min_blue=$num
                    fi
                    ;;
            esac
        done <<< $draws
    done <<< $record
    power=$(($min_red*$min_green*$min_blue))
    #echo "$power - $line"
    sum=$(($sum+$power))
done < $1

echo $sum

exit 0
