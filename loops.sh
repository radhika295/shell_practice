#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo -e "$R ERROR :: Please run this scirpt with root privilage $N"
    exit 1
fi
LOGS_FOLDER="/var/log/shell-scripting"

SCRIPT_NAME=$( echo $0 | cut -d "." -f1)

LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo "Script satrted executed at: $(date)" | tee -a $LOG_FILE

VALIDATE() {
    if [ $1 -eq 0 ]; then
         echo -e "$2 is installed successfully: $G Success $N" | tee -a $LOG_FILE
         
    else    
         echo -e "$2 is not installed it is failed: $R Failed $N" | tee -a $LOG_FILE
         exit 1
    fi
}

# $@ ---all arguments

for package in $@
do
    dnf list installed $package &>>$LOG_FILE

    #if exit status is 0, already installed, -ne o neee to intsall it
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"

    else
        echo -e "$package already installed ... $Y SKIPPING $N"
    fi
    
done