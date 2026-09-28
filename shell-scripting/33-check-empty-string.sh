#!/usr/bin/env bash

text=""

# -z is true when the string is empty.
if [[ -z "$text" ]]; then
    echo "The string is empty"
else
    echo "The string is not empty"
fi

# -n is true when the string is not empty.
