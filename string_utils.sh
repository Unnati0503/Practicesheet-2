#!/usr/bin/env bash

reverse_string() {
  echo "$1" | rev
}

count_vowels() {
  echo "$1" | grep -o -i '[aeiou]' | wc -l
}

is_palindrome() {
  local r
  r=$(echo "$1" | rev)
  [[ "$1" == "$r" ]] && echo "yes" || echo "no"
}

reverse_string "$1"
count_vowels "$1"
is_palindrome "$1"
