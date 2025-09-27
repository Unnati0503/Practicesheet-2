#!/bin/bash

# ------------------- Rocket -------------------
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

# ------------------- Blast & Fireworks -------------------
blast=(
"      (    )"
"   (   (   )   )"
"     )  ) (  ("
"  (  (   )   )"
"      (    )"
)

firework=(
"           *           "
"       *   |   *       "
"         \\ | /         "
"     * -- *** -- *     "
"         / | \\         "
"       *   |   *       "
"           *           "
)

# ------------------- Colors -------------------
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

# ------------------- Helpers -------------------
center_text() {
  local text="$1"
  local len=${#text}
  local padding=$(( (cols - len) / 2 ))
  printf "%*s%s\n" $padding "" "$text"
}

# ------------------- Countdown -------------------
clear
tput civis
for num in 3 2 1; do
  clear
  echo
  echo
  center_text "$(tput setaf 3; tput bold)$num$(tput sgr0)"
  sleep 1
done
clear
center_text "$(tput setaf 2; tput bold)🚀 LAUNCH! 🚀$(tput sgr0)"
sleep 1

# ------------------- Rocket Launch -------------------
target=$(( rows / 2 ))  # rocket stops at middle

for ((i = rows; i >= target; i--)); do
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

# ------------------- Blast -------------------
clear
top_pad=$(( (rows - ${#blast[@]}) / 2 ))
for ((j = 0; j < top_pad; j++)); do echo; done
for line in "${blast[@]}"; do
  center_text "$(tput setaf 1; tput bold)$line$(tput sgr0)"
done
sleep 1

# ------------------- Fireworks -------------------
for i in {1..5}; do
  color=${colors[$RANDOM % ${#colors[@]}]}
  clear
  top_pad=$(( (rows - ${#firework[@]}) / 2 ))
  for ((j = 0; j < top_pad; j++)); do echo; done
  for line in "${firework[@]}"; do
    center_text "${color}${line}$(tput sgr0)"
  done
  sleep 0.5
done

# ------------------- Final Title -------------------
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
