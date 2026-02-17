#!/bin/bash

# Function: greet
greet() {
    name=$1
    echo "Hello, $name!"
}

# Function: add
add() {
    num1=$1
    num2=$2
    sum=$((num1 + num2))
    echo "Sum is: $sum"
}

# Call the functions
greet "Akash"
add 10 20
