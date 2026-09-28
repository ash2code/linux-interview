#!/usr/bin/env bash

# Store two numbers in variables.
first_number=20
second_number=6

# $(( )) performs integer arithmetic in Bash.
echo "Addition: $((first_number + second_number))"
echo "Subtraction: $((first_number - second_number))"
echo "Multiplication: $((first_number * second_number))"
echo "Division: $((first_number / second_number))"
echo "Remainder: $((first_number % second_number))"

if (( first_number > second_number )); then
    echo "$first_number is greater than $second_number"
fi
