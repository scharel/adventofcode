#!/bin/bash
#
# https://adventofcode.com/2022/day/1 part 2

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

max1=0
max2=0
max3=0
sum=0
current_elf=1
max_elf=1
while read line; do
    if [ -n "$line" ]; then
        sum=$(($sum+$line))
    else
        if [ $sum -gt $max1 ]; then
            max3=$max2
            max2=$max1
            max1=$sum
            max_elf=$current_elf
        elif [ $sum -gt $max2 ]; then
            max3=$max2
            max2=$sum
        elif [ $sum -gt $max3 ]; then
            max3=$sum
        fi
        #echo "Elf $current_elf: $sum"
        current_elf=$(($current_elf+1))
        sum=0
    fi
done < $1

echo "$(($max1+$max2+$max3))"

exit 0
