#!/usr/bin/env bash

# Skip temporary files and process the rest.
for file in /tmp/*; do
    [[ -f "$file" ]] || continue

    if [[ "$file" == *.tmp ]]; then
        continue
    fi

    echo "Processing: $file"
done
