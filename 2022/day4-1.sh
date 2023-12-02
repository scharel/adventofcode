#!/bin/bash
#
# https://adventofcode.com/2022/day/4 part 1

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

sum=0
while read line; do
    if [ -n "$line" ]; then
        secs1=$(echo $line | awk -F',' '{ print $1 }')
        a1=$(echo $secs1 | awk -F'-' '{ print $1 }')
        a2=$(echo $secs1 | awk -F'-' '{ print $2 }')

        secs2=$(echo $line | awk -F',' '{ print $2 }')
        b1=$(echo $secs2 | awk -F'-' '{ print $1 }')
        b2=$(echo $secs2 | awk -F'-' '{ print $2 }')

        res=$(( ($a1 - $b1) * ($a2 - $b2) ))
        #echo "($a1-$b1)*($a2-$b2) : $res"
        if (( $res <= 0 )); then
            sum=$(($sum+1))
        fi
    fi
done < $1
echo $sum   # 500

exit 0
