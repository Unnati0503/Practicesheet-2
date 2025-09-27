#!/bin/bash
read -p "Enter filename: " file
if [ -e "$file" ]; then
    echo "$file exists."
    [ -r "$file" ] && echo "Readable"
    [ -w "$file" ] && echo "Writable"
    [ -x "$file" ] && echo "Executable"
else
    echo "File does not exist."
fi
