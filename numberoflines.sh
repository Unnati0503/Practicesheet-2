#!/usr/bin/env bash
file_stats() {
  local f="$1"
  if [[ ! -f "$f" ]]; then
    echo "file not found"
    return 1
  fi
  local l w c
  read -r l w c < <(wc -l -w -c -- "$f")
  echo "lines:$l words:$w chars:$c"
}
file_stats "$1"
