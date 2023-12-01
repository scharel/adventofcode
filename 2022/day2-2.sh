#!/bin/bash
#
# https://adventofcode.com/2022/day/2 part 2

if [ ! -f "$1" ]; then
    echo "Usage $0 <input-file>"
    exit 1
fi

sum=0

#   A B C
# X S R P : 3 1 2
# Y R P S : 1 2 3
# Z P S R : 2 3 1

#   R P S
# X 1 0 2
# Y 2 1 0
# Z 0 2 1
scores=(1 0 2 2 1 0 0 2 1)
hands=(3 1 2 1 2 3 2 3 1)
handsstr=(Rock Paper Scissors)

while read line; do
    oppo=$(echo $line | awk '{ print $1 }')
    oppo=$((36#$oppo-9))    # a=1 b=2 c=3
    self=$(echo $line | awk '{ print $2 }')
    self=$((36#$self-32))   # x=1 y=2 z=3
    hand=$((${hands[$oppo-1+$((3*(($self-1))))]}))
    score=$((${scores[$(($oppo-1+3*(($hand-1))))]}))
    #echo "$line ($oppo ${handsstr[$oppo-1]} vs $hand ${handsstr[$hand-1]}): $(($score*3)) + $hand"
    sum=$(($sum+$score*3+$hand))
done < $1

echo $sum

exit 0
