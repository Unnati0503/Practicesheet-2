#!/bin/bash

cols=$(tput cols)

# Frames for firecracker blast animation
blast_frames=(
"     .     "
"    ...    "
"   .....   "
"    ...    "
"     .     "
)

blast_frames2=(
"     *     "
"    ***    "
"   *****   "
"    ***    "
"     *     "
)

blast_frames3=(
"    \\|/    "
"   --*--   "
"    /|\\    "
)

blast_frames4=(
"     .     "
"    .'.    "
"   .'o'.   "
"    '.'    "
"     .     "
)

blast_frames5=(
"           "
"    * *    "
"   * * *   "
"    * *    "
"           "
)

# Center and print a frame passed as array name
print_frame() {
  local -n frame=$1
  clear
  local height=${#frame[@]}
  local top_pad=$(( ($(tput lines) - height) / 2 ))
  for ((i=0; i<top_pad; i++)); do echo; done
  for line in "${frame[@]}"; do
    local len=${#line}
    local left_pad=$(( (cols - len) / 2 ))
    printf "%*s\n" $left_pad "$line"
  done
}

# Play animation frames sequentially with delay
for i in {1..3}; do
  print_frame blast_frames
  sleep 0.2
  print_frame blast_frames2
  sleep 0.2
  print_frame blast_frames3
  sleep 0.2
  print_frame blast_frames4
  sleep 0.2
  print_frame blast_frames5
  sleep 0.2
done

clear
