#!/usr/bin/env bash
calculate_sum() {
  local s=0
  for n in "$@"; do
    s=$((s + n))
  done
  echo "$s"
}
calculate_sum "$@"
