#!/bin/bash

text="PROJECT"
while true; do
  clear
  echo "$text" | figlet | lolcat -a -d 10
done





#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)

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

title="Operating System Uses"
items=(
"1. Manage hardware resources"
"2. Provide user interface"
"3. Execute and manage processes"
"4. Handle file system operations"
"5. Manage memory allocation"
"6. Provide security and access control"
)

# Function to center text horizontally
center_text() {
    local text="$1"
    local len=${#text}
    local padding=$(( (cols - len) / 2 ))
    printf "%*s%s\n" $padding "" "$text"
}

clear
tput civis  # Hide cursor

# Rocket flying upwards animation
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

# Blast animation - show blast for 1.5 seconds
clear
for line in "${blast[@]}"; do
    center_text "$line"
done
sleep 1.5

clear

# Show title
center_text "$title"
echo

# Animate the list items one by one
for item in "${items[@]}"; do
    center_text "$item"
    sleep 1.5
done

tput cnorm  # Show cursor again
