#!/usr/bin/env bash

# Change this value to test a different alert level.
threshold=80

# -b means batch mode and -n 1 takes one sample instead of opening the screen view.
# top reports idle CPU, so subtract idle from 100 to get used CPU.
cpu_usage=$(top -bn1 | awk -F',' '/Cpu\(s\)/ {
    for (field = 1; field <= NF; field++) {
        if ($field ~ / id/) {
            gsub(/[^0-9.]/, "", $field)
            printf "%.0f", 100 - $field
            exit
        }
    }
}')

if (( cpu_usage >= threshold )); then
    echo "ALERT: CPU usage is ${cpu_usage}% (threshold: ${threshold}%)"
    exit 1
fi

echo "OK: CPU usage is ${cpu_usage}% (threshold: ${threshold}%)"
