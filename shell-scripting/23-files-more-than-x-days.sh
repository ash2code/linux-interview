#!/usr/bin/env bash

# Sample values. Change them directly when practising.
directory="/var/log"
days=30

if [[ ! -d "$directory" ]]; then
    echo "Directory not found: $directory" >&2
    exit 1
fi

# Print regular files that are older than the requested number of days.
find "$directory" -type f -mtime "+$days" -print
