#!/bin/bash

# Terminal size
rows=$(tput lines)
cols=$(tput cols)

# Rocket ASCII art
rocket=(
"   ^   "
"  /^\\  "
" /_\\ "
" |   | "
" |   | "
" |_| "
" /| |\\ "
"  | |  "
"  ***  "
)

# Blast ASCII art
blast=(
"     _.-^^---....,,--"
" --                  --"
"<                        >)"
"|                         |"
" \\._                   _./"
"    ```--. . , ; .--'''"
"          | |   |"
"       .-=||  | |=-."
"       `-=#$%&%$#=-'"
"          | ;  :|"
"^^^^^^^^^^^^^^^^^^^^^^^^^^^"
)

# Center text helper
center_text() {
  local text="$1"
  local len=${#text}
  local padding=$(( (cols - len) / 2 ))
  printf "%*s%s\n" $padding "" "$text"
}

# 1. Rocket flies up
rocket_height=${#rocket[@]}
pos=$((rows - rocket_height))

while (( pos > 3 )); do
  clear
  for ((i=0; i<pos; i++)); do echo; done
  for line in "${rocket[@]}"; do
    center_text "$line"
  done
  ((pos--))
  sleep 0.07
done

# 2. Blast animation
clear
for line in "${blast[@]}"; do
  center_text "$line"
done
sleep 1.5

# 3. Display "PROJECT OS" with figlet and lolcat animated rainbow
clear
if ! command -v figlet >/dev/null 2>&1; then
  echo "Please install figlet to see the animation."
  exit 1
fi

if ! command -v lolcat >/dev/null 2>&1; then
  echo "Please install lolcat to see the color animation."
  exit 1
fi

text="PROJECT OS"
while true; do
  clear
  echo "$text" | figlet | lolcat -a -d 10
done
