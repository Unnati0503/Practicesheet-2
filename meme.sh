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

cols=$(tput cols)
rows=$(tput lines)

# Firework colors
colors=(
  "$(tput setaf 1; tput bold)"  # Red
  "$(tput setaf 2; tput bold)"  # Green
  "$(tput setaf 4; tput bold)"  # Blue
  "$(tput setaf 5; tput bold)"  # Magenta
  "$(tput setaf 6; tput bold)"  # Cyan
  "$(tput setaf 3; tput bold)"  # Yellow
  "$(tput setaf 7; tput bold)"  # White
)

# Bigger firework burst ASCII
burst=(
"           *           "
"       *   |   *       "
"         \\ | /         "
"      * -- *** -- *    "
"         / | \\         "
"       *   |   *       "
"           *           "
)

center_text() {
  local text="$1"
  local len=${#text}
  local padding=$(( (cols - len) / 2 ))
  printf "%*s%s\n" $padding "" "$text"
}

clear
tput civis  # Hide cursor

# Show multiple fireworks in center
for i in {1..5}; do
  clear

  # Pick a random color
  color=${colors[$RANDOM % ${#colors[@]}]}

  # Simulate rocket rising
  for h in $(seq $((rows-2)) -2 $((rows/2))); do
    clear
    for ((j=0; j<h; j++)); do echo; done
    center_text "|"
    sleep 0.03
  done

  # Explosion (with fade-out)
  for fade in {0..3}; do
    clear
    top_pad=$(( (rows - ${#burst[@]}) / 2 ))
    for ((j=0; j<top_pad; j++)); do echo; done

    for line in "${burst[@]}"; do
      center_text "${color}${line}$(tput sgr0)"
    done
    sleep 0.3
  done
done

tput cnorm  # Show cursor again
clear






#!/bin/bash

text="PROJECT O S"
while true; do
  clear
  echo "$text" | figlet | lolcat -a -d 10
done
