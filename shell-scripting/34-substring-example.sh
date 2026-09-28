#!/usr/bin/env bash

text="LinuxShell"

# ${text:start:length} extracts part of a string.
part=${text:0:5}

echo "Original text: $text"
echo "Substring: $part"
