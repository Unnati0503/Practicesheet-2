#!/bin/bash
while true; do
    usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    if [ $usage -gt 80 ]; then
        echo "Warning: Disk usage above 80% ($usage%)"
    fi
    sleep 300   # 5 minutes
done
