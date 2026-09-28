#!/usr/bin/env bash

# Sample values. Change them directly when practising.
path="/"
threshold=80

# Read the used percentage for the selected filesystem.
usage=$(df -h "$path" | awk 'NR == 2 {print $5}' | tr -d '%')

if (( usage >= threshold )); then
    echo "ALERT: $path is ${usage}% full"
    exit 1
fi

echo "OK: $path is ${usage}% full"
