#!/bin/bash
echo "Enter 4 numbers:"
read a b c d
largest=$a
for n in $b $c $d; do
    if [ $n -gt $largest ]; then
        largest=$n
    fi
done
echo "Largest = $largest"
