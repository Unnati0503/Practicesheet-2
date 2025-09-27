#!/bin/bash
read -p "Enter marks: " m
if [ $m -ge 90 ]; then
    echo "Grade: A"
elif [ $m -ge 75 ]; then
    echo "Grade: B"
elif [ $m -ge 50 ]; then
    echo "Grade: C"
else
    echo "Fail"
fi
