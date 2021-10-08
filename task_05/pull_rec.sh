#!/bin/bash

########## Error managment ##########
if [ ! -n "$1" ]
then
	echo "Error: need at least repo url"
	exit 1
fi

CHECK_STR='[0-9]'

if [ ! -n "$2" ]
then
	HOW_MANY_CB=3 ### <- if you want to change default number of contributors
else
	HOW_MANY_CB=$2
	if ! [[ $HOW_MANY_CB =~ $CHECK_STR ]]
	then
		echo "Error: second ARG not a number"
		exit 1
	fi
fi

if [ -n "$3" ]
then
	echo "Error: too many ARGs"
	exit 1
fi

NAME="$(echo $1 | grep / | cut -d/ -f4)"
PROJECT="$(echo $1 | grep / | cut -d/ -f5)"
URL="https://api.github.com/repos/$NAME/$PROJECT/pulls"

URL_CHECK="$(curl -o /dev/null --silent --head --write-out '%{http_code}' $URL)"

if [ ! "$URL_CHECK" = "200" ]
then
	echo "Error: URL does not exist"
	exit 1
else
########## Main path ##########
	REQUESTS="$(curl $URL)"
	TRY="$(echo $REQUESTS | jq .[0])"
	if [ "$TRY" = "null" ]
	then
		echo "There are no pullrequests in this repo"
		exit 1
	fi
	COUNT="$(echo "$REQUESTS" | jq .[].title | wc -l)"

	for (( i=0; i < $COUNT; i++ ))
	do
		TMP=$(echo "$REQUESTS" | jq .[$i].user.login)
		echo $TMP >> tmp_file_pull
	done

	echo "Top $HOW_MANY_CB the most productive contributors:"
	cat tmp_file_pull | sort | uniq -c | sort -nr | head -n $HOW_MANY_CB | cat

	rm -rf tmp_file_pull
fi
