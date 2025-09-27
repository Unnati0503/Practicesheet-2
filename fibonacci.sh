#!/usr/bin/env bash
fibonacci() {
  local n="$1"
  if (( n <= 0 )); then
    echo 0
  elif (( n == 1 )); then
    echo 1
  else
    local a b
    a=$(fibonacci $((n - 1)))
    b=$(fibonacci $((n - 2)))
    echo $((a + b))
  fi
}
fibonacci "$1"
