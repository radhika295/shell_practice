#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run this scirpt with root privilage"
    exit 1
fi

VALIDATE() {
    if [ $1 -eq 0 ]; then
         echo "$2 is installed successfully"
         exit 1
    else    
         echo "$2 is not installed it is failed"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"
dnf install nginx -y
VALIDATE $? "Nginx"
dnf install mongodb-mongosh -y
VALIDATE $? "Mongodb"