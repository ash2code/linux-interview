#!/usr/bin/env bash

# The first argument is the username we want to check.
username="root"

if [[ -z "$username" ]]; then
    echo "Usage: $0 USERNAME" >&2
    exit 1
fi

if id "$username" >/dev/null 2>&1; then
    echo "User exists: $username"
else
    echo "User does not exist: $username"
    exit 1
fi
