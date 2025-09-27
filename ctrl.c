#!/bin/bash
trap "echo 'Termination not allowed, press q to quit.'" SIGINT
while true; do
    read -p "Enter input: " inp
    [ "$inp" = "q" ] && break
done
