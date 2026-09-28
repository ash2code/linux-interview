#!/usr/bin/env bash

# continue skips the current loop and moves to the next number.
for number in 1 2 3 4 5; do
    if [[ "$number" == "3" ]]; then
        continue
    fi

    echo "Number: $number"
done
