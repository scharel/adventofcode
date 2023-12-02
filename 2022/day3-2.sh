#!/bin/bash
#
# https://adventofcode.com/2022/day/3 part 2

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

sum=0
first=""
match=""

while read line; do
    if [ -n "$line" ]; then
        if [ -z "$first" ]; then
            first=$line
        elif [ -z "$match" ]; then
            match=$(echo $line | grep -o "[$first]" | tr -d "\n")
        else
            match=$(echo $line | grep -o "[$match]" | head -n 1)
            prio=$(printf "%d" \'$match)
            prio=$(($prio-38))
            if [ $prio -gt 52 ]; then
                prio=$(($prio-58))
            fi
            #echo "$items1 | $items2 : $match ($prio)"
            sum=$((sum+$prio))
            first=""
            match=""
        fi
    fi
done < $1

echo $sum

exit 0
