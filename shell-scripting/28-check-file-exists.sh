#!/usr/bin/env bash

# The first argument is the path we want to check.
file="/etc/hosts"

if [[ -z "$file" ]]; then
    echo "Usage: $0 FILE" >&2
    exit 1
fi

if [[ -e "$file" ]]; then
    echo "Path exists: $file"
    [[ -f "$file" ]] && echo "It is a regular file"
    [[ -d "$file" ]] && echo "It is a directory"
else
    echo "Path does not exist: $file"
    exit 1
fi
