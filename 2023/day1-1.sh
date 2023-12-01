#!/bin/bash

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

sum=0
while read line; do
    n1=$(echo $line | sed -r 's/^[a-z]*([1-9]).*$/\1/')
    n2=$(echo $line | sed -r 's/^.*([1-9])[a-z]*$/\1/')
    #echo "$line: $n1 $n2"
    sum=$(($sum+$n1$n2))
done < $1

echo $sum

exit 0
