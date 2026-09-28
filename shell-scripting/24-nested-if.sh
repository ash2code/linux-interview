#!/usr/bin/env bash

# The second if runs only when a username was provided.
username="root"

if [[ -n "$username" ]]; then
    if id "$username" >/dev/null 2>&1; then
        echo "User exists: $username"
    else
        echo "User does not exist: $username"
    fi
else
    echo "Usage: $0 USERNAME" >&2
    exit 1
fi
