#!/bin/bash
file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f "$file" ]; then
    echo -e "$R Source file: $file does not exist. $N"
    exit 1
fi

while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path
do
    echo "username: $username"
    echo "user_ID: $user_id"
    echo "user Fullname: $user_fullname"
done < "$file"
