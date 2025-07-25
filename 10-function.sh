#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 .... FAILED"
    else
        echo "$2 .... SUCCESS"
    fi 
}

if [ $ID -ne 0 ]
then 
    echo "ERROR:: Please run this script with root access"
    exit 1 #you can give other than 0
else 
    echo "You are root user"
fi #fi means reverse of if, it idicates the condition end

yum install mysql -y

VALIDATE $? "Installing MySQL"

yum install git -y

VALIDATE $? "Installing Git"