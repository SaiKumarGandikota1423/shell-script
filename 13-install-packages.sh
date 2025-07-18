#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAM=$(date +%F-%H-%M-%S)
LOGFILR="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ... $R FAILED $N"
    else 
        echo -e "   $2 ... $R SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1 # you can give other than 0
else
    echo "You are the root user"
fi # fi menas reverse of if, indicating condition end

#echo "All arguments passed: $@"
#git mysql postfix net-tools
#package=git for first time

for package in $@
do
    yum list installed $package &>> $LOGFILE #check installed or not
    if [ $? -ne 0 ] # if not installed 
    then
        yum install $package -y &>> $LOGFILE # install the package
        VALIDATE $? "Installation of $package" # validate
    else
        echo -e "$Package is already installed ... $Y SKIPPING $N"
    fi
done