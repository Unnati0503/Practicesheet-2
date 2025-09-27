#!/usr/bin/env bash

json_parser() {
    jq "$1" <<EOF
{
    "name": "Alice",
    "age": 25,
    "skills": ["bash", "python", "sql"]
}
EOF
}

# Call with filter, e.g. .name or .skills
json_parser "$1"
