#!/usr/bin/env bash

# Start the counter at 1 and repeat while it is 5 or less.
counter=1

while (( counter <= 5 )); do
    echo "Counter: $counter"
    (( counter++ ))
done
