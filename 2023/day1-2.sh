#!/bin/bash
#
# https://adventofcode.com/2023/day/1 part 2

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

sum=0
digits=(zero one two three four five six seven eight nine)
while read line; do
    tmp=$line
    for i in $(seq 1 9); do
        tmp=$(echo $tmp | sed -r "s/(${digits[$i]})/\1$i\1/g")
    done
    n1=$(echo $tmp | sed -r 's/^[a-z]*([1-9]).*$/\1/')
    n2=$(echo $tmp | sed -r 's/^.*([1-9])[a-z]*$/\1/')
    #echo "$line ($tmp): $n1 $n2"
    sum=$(($sum+$n1$n2))
done < $1

echo $sum

exit 0
