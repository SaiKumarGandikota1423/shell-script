#!/bin/bash
file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ] # denotes opposite
then
    echo -e "$R Source directory: $file does not exit. $N"
fi

while IFS=":" read -r username password user_id group_if user_fullname home_dir shell_path
do
    echo "username: $username"
    echo "user_ID: $user_id"
    echo "user Fullname: $user_fullname"
done <<< $file