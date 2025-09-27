#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)

YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

# Explosion frames: from small spark to big blast
explosion_frames=(
"           .           "

"          .''.          "
"         :\\/:         "
"        : /\\ :        "

"        .:oOo:.        "
"      .:O   O:.       "
"      .:     :.       "

"     _ ._  _ , _ ._    "
"   (_ ' ( `  )_  .)  "
" ( (  (    )   `)  ) _)"
"(__ (_   (_ . ) _) ,_)"
"    ~~\\ ' . /~~    "

"       BOOM!!!        "
"     FIREWORKS!!!     "
)

center_text() {
  local text="$1"
  local len=${#text}
  local padding=$(( (cols - len) / 2 ))
  printf "%*s%s\n" $padding "" "$text"
}

clear
tput civis  # hide cursor

for frame in "${explosion_frames[@]}"; do
  clear
  top_pad=$(( (rows - 7) / 2 ))  # approx 7 lines max height for largest frame
  for ((j=0; j<top_pad; j++)); do echo; done

  # Print the current frame in color
  center_text "${YELLOW}$frame${RESET}"
  sleep 0.4
done

# Full big explosion block
big_explosion=(
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

clear
top_pad=$(( (rows - ${#big_explosion[@]}) / 2 ))
for ((j=0; j<top_pad; j++)); do echo; done
for line in "${big_explosion[@]}"; do
  center_text "${RED}$line${RESET}"
done

echo -e "\a"  # beep on explosion
sleep 3
tput cnorm  # show cursor
clear
