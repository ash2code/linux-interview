#!/usr/bin/env bash

# In [[ ]], || means OR. Either condition can be true.
file="/etc/hosts"

if [[ ! -f "$file" || ! -r "$file" ]]; then
    echo "File is missing or not readable: $file"
    exit 1
fi

echo "File exists and is readable: $file"
