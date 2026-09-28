#!/usr/bin/env bash

text="Linux Shell"

# ^^ converts the string to uppercase.
uppercase=${text^^}

# ,, converts the string to lowercase.
lowercase=${text,,}

echo "Original: $text"
echo "Uppercase: $uppercase"
echo "Lowercase: $lowercase"
