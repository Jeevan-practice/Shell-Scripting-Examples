#!/bin/bash

exec > report_$(date +%Y-%m-%d).txt
#System Health Report Script
#Write a script that collects CPU usage, memory usage, disk space, and 
#top 5 memory-consuming processes, then outputs a formatted report to a file with a timestamp.



echo -e " Report Generated on $(date) \n "
echo  -e "----------------Memory Usage--------------------------\n used/total"
# free -h help us to see used, total and available memory RAM
free -h | awk ' NR==2 {print $3"/"$2}'

# df -h helps to print the different disk with their info
echo -e "----------------disk Usage--------------------------\n"

df -h | awk ' NR!=1 { print $1 "\t" $2"\t" $3 "\t"$4 "\t"$5 }' 

#vmstat is to display process, memory, cpu, system info
echo  -e  "----------------CPU Usage--------------------------\n"
vmstat 1 1 | awk ' NR==3 { print  "CPU Usage=" $13+$14} '

# process consuimng more memory
echo  -e  "----------------Process Consuming Memory--------------------------\n"
ps aux | sort -rn -k4 | awk ' NR<= 5 {print  $1"\t"$4"\t"$11 }'

