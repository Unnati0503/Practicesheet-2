#!/bin/bash
read -p "Enter number: " num
sum=0
until [ $num -eq 0 ]; do
    sum=$((sum + num % 10))
    num=$((num / 10))
done
echo "Sum of digits = $sum"

