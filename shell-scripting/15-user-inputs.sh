#!/usr/bin/env bash

# read waits for the user to type a value.
read -r -p "Enter your name: " name
read -r -p "Enter your environment (dev/test/prod): " environment

if [[ -z "$name" || -z "$environment" ]]; then
    echo "Both values are required" >&2
    exit 1
fi

echo "Hello $name"
echo "Selected environment: $environment"
