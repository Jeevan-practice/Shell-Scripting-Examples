#!/bin/bash

if [ -z "$1" ]; then
    echo -e "Missing log file argument---- \nUsage: ./file.sh logfile_name"
    exit 1
fi
filename=$1
error_count=$(grep -c "ERROR" $filename)
warn_count=$(grep -c "WARN" $filename)
info_count=$(grep -c "INFO" $filename)
#1. take list of ips
#2. sort 
#3. count occurence and sort 
#4. take top1
frequent_ip=$(awk '{print $4}'  $filename | sort | uniq -c | sort -rn -k1 | awk 'NR==1 {print $2}')
echo  -e "ERROR_Count = $error_count\n"
echo -e "WARN_Count = $warn_count\n"
echo -e "INFO_COunt = $info_count\n"
echo -e "Frequently occuring IP = $frequent_ip\n"

if [ $error_count -gt 3 ];
then
     exit 1
else
     exit 0
fi