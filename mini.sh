






#!/bin/bash

rocket=(
"   ^
  /^\\
 /_\\
 |   |
 |   |
 |_|
 /| |\\
  | | 
  *** "
)

height=$(tput lines)
width=$(tput cols)

for ((i=height; i>=0; i--)); do
  clear
  for ((j=0; j<i; j++)); do
    echo
  done
  for line in "${rocket[@]}"; do
    printf "%*s\n" $((width/2)) "$line"
  done
  sleep 0.1
done














#!/bin/bash

text="PROJECT O S"
while true; do
  clear
  echo "$text" | figlet | lolcat -a -d 10
done 









#!/bin/bash

rocket=(
"   ^
  /^\\
 /_\\
 |   |
 |   |
 |_|
 /| |\\
  | | 
  *** "
)

height=$(tput lines)
width=$(tput cols)

for ((i=height; i>=0; i--)); do
  clear
  for ((j=0; j<i; j++)); do
    echo
  done
  for line in "${rocket[@]}"; do
    printf "%*s\n" $((width/2)) "$line"
  done
  sleep 0.1
done
