#!/usr/bin/env bash

# Sample file used by this example.
file="/etc/hosts"

# -f checks whether the path is a regular file.
if [[ -f "$file" ]]; then
    echo "File exists: $file"
else
    echo "File does not exist: $file"
fi
