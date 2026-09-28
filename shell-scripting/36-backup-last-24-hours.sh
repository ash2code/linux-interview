#!/usr/bin/env bash

# Change this directory to the directory you want to back up.
source_directory="/tmp/my-app"
backup_file="/tmp/my-app-last-24-hours.tar.gz"

if [[ ! -d "$source_directory" ]]; then
    echo "Directory not found: $source_directory" >&2
    exit 1
fi

# -mmin -1440 means modified less than 1,440 minutes ago.
# 1,440 minutes equals 24 hours.
cd "$source_directory" || exit 1
find . -type f -mmin -1440 -print0 | tar --null -czf "$backup_file" --files-from=-

echo "Backup created: $backup_file"
