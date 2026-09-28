#!/usr/bin/env bash

# Interview example: keep three old copies of an application log.

log_file="/tmp/application.log"

if [[ ! -f "$log_file" ]]; then
    echo "Log file not found: $log_file" >&2
    exit 1
fi

# Rename old copies from newest to oldest.
for number in 2 1; do
    if [[ -f "${log_file}.${number}" ]]; then
        mv -- "${log_file}.${number}" "${log_file}.$((number + 1))"
    fi
done

# Move the current log to .1 and create a new empty log file.
mv -- "$log_file" "${log_file}.1"
touch "$log_file"
echo "Rotated: $log_file"
