#!/bin/bash

i=0

while read line
do
	if [ $i -eq 0 ]; then
		title=$line
	elif [ "${title}" = "${line}" ]; then
		echo $title
	fi
	
	i=$((i+1))
	echo $i
done < titles.csv
