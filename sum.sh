	#!/usr/bin/env bash

# sum.sh
if [ $# -eq 2 ]; then
  a="$1"; b="$2"
else
  read -p "Enter first number: " a
  read -p "Enter second number: " b
fi

re='^-?[0-9]+([.][0-9]+)?$'
if ! [[ $a =~ $re ]] || ! [[ $b =~ $re ]]; then
  echo "Error: inputs must be numbers."
  exit 1
fi

awk -v x="$a" -v y="$b" 'BEGIN{printf "%g\n", x+y}'

