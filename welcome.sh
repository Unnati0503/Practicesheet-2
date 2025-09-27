#!/usr/bin/env bash

# welcome.sh
read -p "Enter your name: " name
while [ -z "$name" ]; do
  echo "Name cannot be empty. Please try again."
  read -p "Enter your name: " name
done

read -p "Enter your favorite programming language: " lang
while [ -z "$lang" ]; do
  echo "Language cannot be empty. Please try again."
  read -p "Enter your favorite programming language: " lang
done

echo "Hello $name, you like $lang!"
