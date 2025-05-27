#!/bin/bash

USERID=$(id -u) #Checks userId
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_DIR="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_DIR/$SCRIPT_NAME.log"

mkdir -p $LOGS_DIR
echo "Script started executing at: $(date)" &>>$LOG_FILE

if [ "$USERID" -ne 0 ]; then
    echo -e " $R You do not have root access. Please run this script as root. $N" &>>$LOG_FILE
    exit 1
else
    echo -e "$Y You have root access. Proceeding to install Package... $N" &>>$LOG_FILE
fi
# Function Defination
Validate(){ # Takes the i/p from Exit status,what command they tried to install
    if [ $1 -eq 0 ]
   then
      echo -e "Installed $2... $G Success $N" &>>$LOG_FILE
   else
      echo  -e "$2 $R Installation is failed $N" &>>$LOG_FILE
    fi
}

dnf list installed mysql &>>$LOG_FILE #Checks MySQL Installed or not, $? Should be equal to zero then only My Sql Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install SQL
then
   echo -e  " $Y My Sql is not installed-----Going to install $N" &>>$LOG_FILE
   dnf install mysql -y &>>$LOG_FILE #Install My Sql
   Validate $? "MySql" # Function calling 
else
   echo -e " $Y My Sql Already Installed $N" &>>$LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE #Checks python3 Installed or not, $? Should be equal to zero then only python3 Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install python3
then
   echo -e " $Y python3 is not installed-----Going to install $N" &>>$LOG_FILE
   dnf install python3 -y  &>>$LOG_FILE#Install python3
   Validate $? "python3" # Function calling  
else
   echo -e " $Y python3 Already Installed $N" &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE #Checks nginx Installed or not, $? Should be equal to zero then only nginx Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install nginx
then
   echo-e  " $Y nginx is not installed-----Going to install $N" &>>$LOG_FILE
   dnf install nginx -y &>>$LOG_FILE #Install nginx
   Validate $? "nginx"  # Function calling  
else
   echo -e "$Y nginx Already Installed $N" &>>$LOG_FILE
fi