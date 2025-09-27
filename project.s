#!/bin/bash

rocket=(
"    ^"
"  /^\\"
" /__\\"
" |  |"
" |  |"
" |__|"
" /| |\\"
"  | |"
"  ***"
)

height=$(tput lines)
width=$(tput cols)

for ((i = height; i >= 0; i--)); do
  clear
  for ((j = 0; j < i; j++)); do echo; done

  for line in "${rocket[@]}"; do
    printf "%*s\n" $(( (width + ${#line}) / 2 )) "$line"
  done
  sleep 0.05
done

sleep 0.5
clear
tput civis

blast=(
"    . "
"  /   \\"
" /-- --\\"
"| * * * |"
" \\-- --/"
"  \\   / "
"    . "
)

blast2=(
"     * "
"  .  * . "
" * / \\ * "
"--- * ---"
" * \\ / * "
"  '  * ' "
"     * "
)

blast3=(
"    .  * "
"  * .  "
"   . * "
"    '   * "
"  .   . "
"     * . "
" * ' "
)

explosion_frames=("${blast[@]}" "${blast2[@]}" "${blast3[@]}")

# Position the blast at the top of the screen
top_pad=$(( (height - 7) / 4 ))

# Animate the explosion
for frame in 1 2 3 4 5; do
  clear
  for ((j = 0; j < top_pad; j++)); do echo; done

  # Select which frame to display
  if [ $((frame % 3)) -eq 1 ]; then
    current_frame=("${blast[@]}")
  elif [ $((frame % 3)) -eq 2 ]; then
    current_frame=("${blast2[@]}")
  else
    current_frame=("${blast3[@]}")
  fi

  for line in "${current_frame[@]}"; do
    printf "%*s\n" $(( (width + ${#line}) / 2 )) "$line"
  done
  sleep 0.1
done

tput cnorm
clear

text="PROJECT O S"
while true; do
  clear
  width=$(tput cols)
  height=$(tput lines)

  IFS=$'\n' read -rd '' -a lines <<< "$(figlet "$text")"

  num_lines=${#lines[@]}
  top_padding=$(( (height - num_lines) / 2 ))

  for ((i = 0; i < top_padding; i++)); do echo; done

  for line in "${lines[@]}"; do
    printf "%*s\n" $(( (width + ${#line}) / 2 )) "$line" | lolcat -a -d 10
  done

  sleep 0.3
done
