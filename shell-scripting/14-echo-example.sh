#!/usr/bin/env bash

# Variables can be included inside double quotes.
name="Linux"
echo "Hello, $name"

# Single quotes print the text exactly as written.
echo 'Single quotes keep $name literal'

# printf gives more control over the output format.
printf 'User: %s\n' "${USER:-unknown}"
printf 'Current directory: %s\n' "$PWD"
