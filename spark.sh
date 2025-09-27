#!/bin/bash

cols=$(tput cols)
rows=$(tput lines)

# Firecracker fuse and spark frames, moving downwards
fuse_frames=(
"     .      "
"     ..     "
"     ...    "
"     ....   "
"     .....  "
"     ...... "
"     ....... "
"      ( )   "
"      ( )   "
"      ( )   "
)

# Spark frames to simulate the fuse burning
spark_frames=(
"     .      "
"    \\|/     "
"    --*--   "
"    /|\\     "
"     '      "
)

# Explosion ASCII art (simple big bang)
explosion=(
"        _ ._  _ , _ ._         "
"      (_ ' ( `  )_  .)      "
"    ( (  (    )   `)  ) _)    "
"   (__ (_   (_ . ) _) ,_)   "
"       ~~\\ ' . /~~        "
"            ;   ;             "
"            /   \\             "
"/ __ \\"
)

center_text() {
  local text="$1"
  local len=${#text}
  local padding=$(( (cols - len) / 2 ))
  printf "%*s%s\n" $padding "" "$text"
}

clear
tput civis  # Hide cursor

# Animate fuse burning down
for i in "${!fuse_frames[@]}"; do
  clear
  # Print empty lines to vertically center the animation
  top_pad=$(( (rows - ${#fuse_frames[@]}) / 2 ))
  for ((j=0; j<top_pad; j++)); do echo; done

  # Print fuse up to current frame
  for ((k=0; k<=i; k++)); do
    center_text "${fuse_frames[k]}"
  done

  # Add spark flicker at the end of fuse burning
  if (( i > 0 )); then
    center_text "${spark_frames[i % ${#spark_frames[@]}]}"
  fi

  sleep 0.3
done

# Explosion
clear
top_pad=$(( (rows - ${#explosion[@]}) / 2 ))
for ((j=0; j<top_pad; j++)); do echo; done
for line in "${explosion[@]}"; do
  center_text "$line"
done

sleep 2
tput cnorm  # Show cursor again
clear
