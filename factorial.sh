5.factorial.sh

#!/usr/bin/env bash

# factorial.sh
read -p "Enter a non-negative integer: " n
if ! [[ $n =~ ^[0-9]+$ ]]; then
  echo "Error: input must be a non-negative integer."
  exit 1
fi

# use bc if available to handle big numbers
if command -v bc >/dev/null 2>&1; then
  i=1
  fact=1
  while [ $i -le $n ]; do
    fact=$(echo "$fact * $i" | bc)
    i=$((i+1))
  done
else
  # fallback to bash arithmetic (may overflow for large n)
  i=1
  fact=1
  while [ $i -le $n ]; do
    fact=$((fact * i))
    i=$((i+1))
  done
fi

echo "$n! = $fact"


