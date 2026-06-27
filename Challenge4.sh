#!/bin/bash

# awk -F: ' $3>=1000 { print $1, $6}' /etc/passwd | while read username homedir; do
#  if [ -d "$homedir" ]; then
#     echo "$username - Home directory Exists"
# else
#    echo "$username - Home dir Not Exists"
# fi 
# lastlog -u "$username" | awk ' $2=="**Never" {print "Warning -------------"$1" never logged in ------"}'
# done

#Users never loggedin

# lastlog | grep "Never" | awk '{print $1}' | while read username; do
#    echo " Warning -------- $username has never logged in -------------"
#    done

read -p "Enter ur name" name
echo "My name is $name"
