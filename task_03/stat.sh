#!/bin/bash
if [ "$1" == "" ] || [ "$1" == "help" ]; then
	printf "Try \"bash stat.sh name_or_PID_of_the_process\"\n"
fi

IFS=$'\0'

VAR1=$(netstat -tunapl)
VAR2=$(echo $VAR1 | awk "/$1/ {print\$5}")
VAR3=$(echo $VAR2 | cut -d: -f1)
VAR4=$(echo $VAR3 | sort)
VAR5=$(echo $VAR4 | tail -n5)
VAR6=$(echo $VAR5 | grep -oP '(\d+\.){3}\d+')
VAR7=$(echo $VAR6 | 
	while read IP
	do whois $IP | awk -F ':' "/Organization/ {print\$2}"; done)
echo $VAR7
