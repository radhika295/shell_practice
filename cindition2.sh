#!/bin/bash

echo "Please enter the nunber:"
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "Given number $NUMBER is even"
else
    echo "Given number $Number is odd"
fi