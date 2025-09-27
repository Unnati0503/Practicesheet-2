#!/usr/bin/env bash

# compare.sh
# Accept two args or prompt interactively
if [ $# -eq 2 ]; then
  a="$1"; b="$2"
else
  read -p "Enter first number: " a
  read -p "Enter second number: " b
fi

re='^-?[0-9]+([.][0-9]+)?$'
if ! [[ $a =~ $re ]] || ! [[ $b =~ $re ]]; then
  echo "Error: please enter valid numbers (integers or decimals)."
  exit 1
fi

cmp=$(awk -v x="$a" -v y="$b" 'BEGIN{if (x==y) print "eq"; else if (x>y) print "gt"; else print "lt"}')

if [ "$cmp" = "eq" ]; then
  echo "$a and $b are equal."
elif [ "$cmp" = "gt" ]; then
  echo "$a is greater than $b."
else
  echo "$b is greater than $a."
fi

