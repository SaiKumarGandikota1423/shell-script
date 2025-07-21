#!/bin/bash

set -e 

ls -ltr

touch example.txt

echo "before wrong command"

lsff

echo "After wrong command"

cd /tmp/

cd /home/centos