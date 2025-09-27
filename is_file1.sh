#!/usr/bin/env bash
is_file() {
  if [[ -f "$1" ]]; then
    echo "yes"
    return 0
  else
    echo "no"
    return 1
  fi
}
is_file "$1"
