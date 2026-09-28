#!/usr/bin/env bash

# eval runs text as a shell command.
command_text="date"
eval "$command_text"

# Do not use eval with input from a user. It can run dangerous commands.
# In real scripts, prefer direct execution such as: date
