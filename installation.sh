#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run this scirpt with root privilage"
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "Mysql is installed successfully"
else    
    echo "Mysql is not installed it is failed"
fi