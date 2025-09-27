#!/bin/bash
while true; do
    echo "1. View Date"
    echo "2. List Files"
    echo "3. Current Directory"
    echo "4. Exit"
    read -p "Enter choice: " ch
    case $ch in
        1) date ;;
        2) ls ;;
        3) pwd ;;
        4) exit ;;
        *) echo "Invalid choice" ;;
    esac
done
