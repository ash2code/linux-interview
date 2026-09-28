#!/usr/bin/env bash

# Change this value to test a different alert level.
threshold=80

# free reports memory in kilobytes. Calculate used memory as a percentage.
usage=$(free | awk '/Mem:/ {printf "%.0f", ($3 / $2) * 100}')

echo "Memory usage: ${usage}%"

if (( usage >= threshold )); then
    echo "ALERT: memory usage is above ${threshold}%"
    exit 1
fi
