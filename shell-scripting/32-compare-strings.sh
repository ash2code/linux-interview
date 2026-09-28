#!/usr/bin/env bash

first_string="Linux"
second_string="Linux"

# == compares two strings.
if [[ "$first_string" == "$second_string" ]]; then
    echo "The strings are the same"
else
    echo "The strings are different"
fi

# != checks that two strings are different.
