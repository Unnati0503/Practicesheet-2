#!/bin/bash

rocket=(
"     ^"
"    /^\\"
"   /_\\"
"   |   |"
"   |   |"
"   |_|"
"   /| |\\"
"    | |"
)

flames=(
"    ***"
"   *****"
"    ***"
)

burst=(
"           *           "
"       *   |   *       "
"         \\ | /         "
"     * -- *** -- *     "
"         / | \\         "
"       *   |   *       "
"           *           "
)

cols=$(tput cols)
rows=$(tput lines)
colors=(
  "$(tput setaf 1; tput bold)"  # Red
  "$(tput setaf 2; tput bold)"  # Green
  "$(tput setaf 4; tput bold)"  # Blue
  "$(tput setaf 5; tput bold)"  # Magenta
  "$(tput setaf 6; tput bold)"  # Cyan
  "$(tput setaf 3; tput bold)"  # Yellow
  "$(tput setaf 7; tput bold)"  # White
)

center_text() {
  local text="$1"
  local len=${#text}
  local padding=$(( (cols - len) / 2 ))
  printf "%*s%s\n" $padding "" "$text"
}

height=$(tput lines)
for ((i = height; i >= 0; i--)); do
  clear
  for ((j = 0; j < i; j++)); do echo; done

  for line in "${rocket[@]}"; do
    printf "%*s\n" $(( (cols + ${#line}) / 2 )) "$line"
  done

  for flame in "${flames[@]}"; do
    printf "%*s\n" $(( (cols + ${#flame}) / 2 )) "$(tput setaf 3)$flame$(tput sgr0)"
  done

  sleep 0.05
done

sleep 1
tput civis
for i in {1..5}; do
  color=${colors[$RANDOM % ${#colors[@]}]}
  clear
  for h in $(seq $((rows - 2)) -2 $((rows / 2))); do
    clear
    for ((j = 0; j < h; j++)); do echo; done
    center_text "|"
    sleep 0.02
  done

  for fade in {0..2}; do
    clear
    top_pad=$(( (rows - ${#burst[@]}) / 2 ))
    for ((j = 0; j < top_pad; j++)); do echo; done
    for line in "${burst[@]}"; do
      center_text "${color}${line}$(tput sgr0)"
    done
    sleep 0.2
  done
done
tput cnorm

text="PROJECT O S"
thanks="Dedicated to Yayati Ma'am ❤"
while true; do
  clear
  width=$(tput cols)
  height=$(tput lines)

  IFS=$'\n' read -rd '' -a lines <<< "$(figlet "$text")"
  num_lines=${#lines[@]}
  top_padding=$(( (height - num_lines - 3) / 2 ))

  for ((i = 0; i < top_padding; i++)); do echo; done

  for line in "${lines[@]}"; do
    printf "%*s\n" $(( (width + ${#line}) / 2 )) "$line" | lolcat -a -d 5
  done

  echo
  center_text "$(echo "$thanks" | lolcat -a -d 5)"

  sleep 0.3
done
