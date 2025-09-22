#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "$R ERROR :: Please run this scirpt with root privilage $N"
    exit 1
fi

VALIDATE() {
    if [ $1 -eq 0 ]; then
         echo -e "$2 is installed successfully: $G Success $N"
         
    else    
         echo "$2 is not installed it is failed: $R Failed $N"
         exit 1
    fi
}
dnf list installed mysql 
if [$? -ne 0]; then 
   dnf install mysql -y
   VALIDATE $? "MYSQL"
else
    echo "MySql already existed...$G Skipped $N"
fi
dnf list installed nginx
if [$? -ne 0]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "Nginx already existed...$G Skipped $N"
fi