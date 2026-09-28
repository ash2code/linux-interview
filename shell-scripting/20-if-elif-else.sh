#!/usr/bin/env bash

# The interview topic is often called if-elif-else.
score=80

if (( score >= 90 )); then
    echo "Grade: A"
elif (( score >= 75 )); then
    echo "Grade: B"
elif (( score >= 60 )); then
    echo "Grade: C"
else
    echo "Grade: F"
fi
