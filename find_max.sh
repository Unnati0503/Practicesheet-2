#!/usr/bin/env bash
find_max() {
  local max=$1
  for n in "$@"; do
    (( n > max )) && max=$n
  done
  echo "$max"
}
find_max "$@"
