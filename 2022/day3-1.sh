#!/bin/bash
#
# https://adventofcode.com/2022/day/3 part 1

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

sum=0

while read line; do
    if [ -n "$line" ]; then
        num=${#line}
        items1=${line:0:$(($num/2))}
        items2=${line:$(($num/2)):$num}
        match=$(echo $items1 | grep -o "[$items2]" | head -n 1)
        prio=$(printf "%d" \'$match)
        prio=$(($prio-38))
        if [ $prio -gt 52 ]; then
            prio=$(($prio-58))
        fi
        #echo "$items1 | $items2 : $match ($prio)"
        sum=$((sum+$prio))
    fi
done < $1

echo $sum

exit 0
