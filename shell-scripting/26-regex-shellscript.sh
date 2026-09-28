#!/usr/bin/env bash

# Bash uses =~ for regular-expression matching.
value="12345"

if [[ "$value" =~ ^[0-9]+$ ]]; then
    echo "Only digits: $value"
elif [[ "$value" =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]; then
    echo "Valid shell-style name: $value"
else
    echo "Value does not match the expected patterns: $value"
    exit 1
fi
