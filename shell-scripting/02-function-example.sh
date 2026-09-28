#!/usr/bin/env bash

# Interview example: define a function and return a useful status.
check_directory() {
    local directory=$1

    if [[ -d "$directory" ]]; then
        echo "$directory exists"
        return 0
    fi

    echo "$directory does not exist"
    return 1
}

# Call the function with a sample directory.
check_directory "/tmp"
