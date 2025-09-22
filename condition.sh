#!/bin/bash

NUMBER-=$1

if [ $NUMBER -lt 10 ]; then
    echo "Given number is less thatn 10"
else
    echo "Given number $NUMBER is greater then 10"
fi