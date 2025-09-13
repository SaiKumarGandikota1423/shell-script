#!/bin/bash

SOURCE_DIR="/tmp/shellscript-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "$R Source directory: $SOURCE_DIR does not exist. $N"
    exit 1   # stop script here
fi

FILES_TO_DELETE=$(find "$SOURCE_DIR" -type f -mtime +14 -name "*.log")

if [ -z "$FILES_TO_DELETE" ]; then
    echo -e "$Y No old log files found to delete in $SOURCE_DIR $N"
    exit 0
fi

while IFS= read -r line; do
    echo "Deleting file: $line"
    # Uncomment below to actually delete:
    # rm -f "$line"
done <<< "$FILES_TO_DELETE"
