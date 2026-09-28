#!/usr/bin/env bash

# Usage: ./31-special-parameters.sh first "second value" third

echo "Number of arguments (\$#): $#"
echo "Script name (\$0): $0"
echo "All arguments as separate words (\$@):"
for argument in "$@"; do
    echo "- $argument"
done

false
status=$?
echo "Exit status of the previous command (\$?): $status"

# Prefer \"$@\" when passing arguments because it preserves each argument.
# \"$*\" joins all arguments into one word when quoted.
