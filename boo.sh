#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)

# Colors for fading (from bright yellow to dim)
colors=(
  "$(tput setaf 3)"        # Bright yellow
  "$(tput setaf 3; tput dim)"  # Dim yellow
  "$(tput setaf 8)"        # Gray
  "$(tput sgr0)"           # Reset/no color (faded out)
)

explosion_frames=(
"          _ ._  _ , _ ._           "
"        (_ ' ( `  )_  .)         "
"      ( (  (    )   `)  ) _)       "
"     (__ (_   (_ . ) _) ,_)      "
"         ~~\\ ' . /~~           "
"              ;   ;                "
"              /   \\                "
"     _______/     \\_______       "
"    /                     \\       "
"   |    BOOM! FIREWORKS!   |       "
"    \\_/        "
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

tput cnorm  # Show cursor
clear
