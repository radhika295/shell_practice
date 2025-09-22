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

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then 
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "MYSQL"
else
    echo -e "MySql already existed...$G Skipped $N" | tee -a $LOG_FILE
fi
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already existed...$G Skipped $N" | tee -a $LOG_FILE
fi