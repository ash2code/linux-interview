#!/usr/bin/env bash

# Stop searching as soon as the target file is found.
target="app.conf"

for directory in /etc /opt /tmp; do
    if [[ -f "$directory/$target" ]]; then
        echo "Found: $directory/$target"
        break
    fi
    echo "Not found in: $directory"
done
