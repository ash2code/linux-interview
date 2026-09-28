#!/usr/bin/env bash

# Usage:
#   ./04-backup-and-restore.sh backup source_dir backup.tar.gz
#   ./04-backup-and-restore.sh restore backup.tar.gz destination_dir

action=$1

case "$action" in
    backup)
        source_dir=$2
        archive=$3

        if [[ ! -d "$source_dir" || -z "$archive" ]]; then
            echo "Usage: $0 backup SOURCE_DIR BACKUP.tar.gz" >&2
            exit 1
        fi

        # c = create, z = gzip compression, f = archive filename.
        tar -czf "$archive" "$source_dir"
        echo "Backup created: $archive"
        ;;
    restore)
        archive=$2
        destination=$3

        if [[ ! -f "$archive" || -z "$destination" ]]; then
            echo "Usage: $0 restore BACKUP.tar.gz DESTINATION_DIR" >&2
            exit 1
        fi

        # Create the destination and extract the archive into it.
        mkdir -p "$destination"
        tar -xzf "$archive" -C "$destination"
        echo "Backup restored to: $destination"
        ;;
    *)
        echo "Choose backup or restore" >&2
        exit 1
        ;;
esac
