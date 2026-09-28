#!/usr/bin/env bash

# Sample file used by this example.
file="/etc/hosts"

# AND: both conditions must be true.
if [[ -f "$file" && -r "$file" ]]; then
    echo "$file is a readable file"
fi

# OR: at least one condition must be true.
if [[ ! -f "$file" || ! -s "$file" ]]; then
    echo "$file is missing or empty"
fi

# NOT: reverse a condition.
if ! command -v curl >/dev/null 2>&1; then
    echo "curl is not installed"
fi
