#!/bin/bash

text="PROJECT"
while true; do
  clear
  echo "$text" | figlet | lolcat -a -d 10
done




#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)

# Rocket ASCII
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

# Blast ASCII
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

# Computer ASCII art (simple desktop monitor)
computer=(
"       _____________________"
"      |  _________________  |"
"      | |                 | |"
"      | |                 | |"
"      | |                 | |"
"      | |_| |"
"      |  ___ ___ ___ ___ ___|"
"      | | 7 | 8 | 9 | + |   |"
"      | |||||   |"
"      | | 4 | 5 | 6 | - |   |"
"      | |||||   |"
"      | | 1 | 2 | 3 | x |   |"
"      | |||||   |"
"      | | . | 0 | = | / |   |"
"      | |||||   |"
"      |_|"
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

# Helper: center text horizontally
center_text() {
    local text="$1"
    local len=${#text}
    local padding=$(( (cols - len) / 2 ))
    printf "%*s%s\n" $padding "" "$text"
}

clear
tput civis  # Hide cursor

# Rocket launch animation
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

# Blast animation
clear
for line in "${blast[@]}"; do
    center_text "$line"
done
sleep 1.5

clear

# Show computer ASCII art with fade-in effect (line by line)
for ((i=1; i<=${#computer[@]}; i++)); do
    clear
    # Calculate top padding to vertically center partial art
    top_pad=$(( (rows - i) / 2 ))
    for ((j=0; j<top_pad; j++)); do echo; done
    for ((k=0; k<i; k++)); do
        center_text "${computer[k]}"
    done
    sleep 0.1
done

echo

# Show title centered below computer
center_text "$title"
echo

# Animate the list items one by one below the computer art
for item in "${items[@]}"; do
    center_text "$item"
    sleep 1.5
done

tput cnorm  # Show cursor again
