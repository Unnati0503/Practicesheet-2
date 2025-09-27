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

menu() {
    while true; do
        echo "1) Reverse string"
        echo "2) Count vowels"
        echo "3) Check palindrome"
        echo "4) Exit"
        read -p "Choice: " c
        read -p "Enter string: " s

        case $c in
            1) reverse_string "$s" ;;
            2) count_vowels "$s" ;;
            3) is_palindrome "$s" ;;
            4) exit 0 ;;
            *) echo "invalid" ;;
        esac
    done
}

menu
