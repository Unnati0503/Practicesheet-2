#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)

# Colors for fading (bright → dim → gone)
colors=(
  "$(tput setaf 7; tput bold)"   # Bright white
  "$(tput setaf 7)"              # Normal white
  "$(tput setaf 8)"              # Gray
  "$(tput sgr0)"                 # Reset (faded out)
)

# Firework burst frames (radial lines)
explosion_frames=(
"               .''.               "
"       .''.      .        ''    "
"      :\\/:   \\(/  .:.*\\/:.  "
"  .''.: /\\ :   /)\\   ':'* /\\ * :  "
" :\\/:'.:::.    ' ''    ':::. "
" : /\\ : :::::     \\/     ':::. "
"  '..'  ':::'     * /\\ *      ':::'"
"        *            *           * "
)

center_text() {
  local text="$1"
  local len=${#text}
  local padding=$(( (cols - len) / 2 ))
  printf "%*s%s\n" $padding "" "$text"
}

clear
tput civis  # Hide cursor

# Show explosion with fading effect
for color in "${colors[@]}"; do
  clear
  top_pad=$(( (rows - ${#explosion_frames[@]}) / 2 ))
  for ((j=0; j<top_pad; j++)); do echo; done
  for line in "${explosion_frames[@]}"; do
    center_text "${color}${line}$(tput sgr0)"
  done
  sleep 0.6
done

tput cnorm  # Show cursor again
clear
