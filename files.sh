#!/usr/bin/env bash

# files.sh
shopt -s nullglob 2>/dev/null || true   # enable nullglob in bash; ignore if shell doesn't support
txts=( *.txt )

if [ ${#txts[@]} -eq 0 ]; then
  echo "No .txt files found in $(pwd)."
  exit 0
fi

for f in "${txts[@]}"; do
  echo "$f"
done

