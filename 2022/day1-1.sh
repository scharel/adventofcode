#!/bin/bash
#
# https://adventofcode.com/2022/day/1 part 1

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

max=0
sum=0
current_elf=1
max_elf=1
while read line; do
    if [ -n "$line" ]; then
        sum=$(($sum+$line))
    else
        if [ $sum -gt $max ]; then
            max=$sum
            max_elf=$current_elf
        fi
        #echo "Elf $current_elf: $sum"
        current_elf=$(($current_elf+1))
        sum=0
    fi
done < $1

echo "Elf $max_elf is carrying $max Calories"

exit 0
