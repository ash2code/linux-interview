#!/usr/bin/env bash

# Usage: ./16-user-passing-arguments.sh USERNAME ROLE
# The script expects exactly two arguments.
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 USERNAME ROLE" >&2
    exit 1
fi

# $1 is the first argument and $2 is the second argument.
username=$1
role=$2

echo "Username: $username"
echo "Role: $role"
