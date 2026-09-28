#!/usr/bin/env bash

# Usage: sudo ./08-useradd.sh USERNAME

username=$1

if [[ -z "$username" ]]; then
    echo "Usage: $0 USERNAME" >&2
    exit 1
fi

# id returns success when the user already exists.
if id "$username" >/dev/null 2>&1; then
    echo "User already exists: $username"
    exit 0
fi

# Create the user with a home directory and Bash as the login shell.
useradd --create-home --shell /bin/bash "$username"
echo "Created user: $username"
