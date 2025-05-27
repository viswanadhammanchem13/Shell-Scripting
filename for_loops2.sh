#!/bin/bash

USERID=$(id -u) #Checks userId
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_DIR="/var/log/shellscript-logs" #Mention to Save the logs in this Dir
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #Rename the script file from Redirections.sh to Redirections
LOG_FILE="$LOGS_DIR/$SCRIPT_NAME.log" #Save the log file as Redirections.log under shellscript-logs DIR 
PACKAGES=("mysql" "python" "nginx" "httpd") #Install all packages at a time

mkdir -p $LOGS_DIR #Creates LOG_DIR
echo "Script started executing at: $(date)" | tee -a $LOG_FILE #Captures the Time when script is started

if [ "$USERID" -ne 0 ]; then
    echo -e " $R You do not have root access. Please run this script as root. $N" | tee -a $LOG_FILE 
    exit 1
else
    echo -e "$Y You have root access. Proceeding to install Package... $N" | tee -a $LOG_FILE
fi
# Function Defination
Validate(){ # Takes the i/p from Exit status,what command they tried to install
    if [ $1 -eq 0 ]
   then
      echo -e "Installed $2... $G Success $N" | tee -a $LOG_FILE
   else
      echo  -e "$2 $R Installation is failed $N" | tee -a $LOG_FILE
    fi
}
for package in {$PACKAGES[@]}

dnf list installed $package &>>$LOG_FILE #Checks MySQL Installed or not, $? Should be equal to zero then only My Sql Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install SQL
then
   echo -e  " $Y $package is not installed-----Going to install $N" | tee -a $LOG_FILE
   dnf install $package -y &>>$LOG_FILE #Install My Sql
   Validate $? "$package" # Function calling 
else
   echo -e " $Y $package Already Installed $N" | tee -a $LOG_FILE
fi
