#!/bin/bash
if [ "$1" == "" ] || [ "$1" == "help" ]; then
	printf "Try \"bash stat.sh name_or_PID_of_the_process\"\n"
fi

IFS=$'\0'

VAR1=$(netstat -tunapl | awk "/$1/ {print\$5}" | cut -d: -f1 | sort | tail -n5 | grep -oP '(\d+\.){3}\d+')
REZ=$(echo $VAR1 | 
	while read IP
	do whois $IP | awk -F ':' "/^Organization/ {print\$2}"; done)
echo $REZ
