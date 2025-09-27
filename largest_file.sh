#!/bin/bash
read -p "Enter directory: " dir
find "$dir" -type f -exec du -h {} + | sort -rh | head -5
