#!/bin/bash 

even="true"
subtractor=0
subtractor2=$(head -n 1 $1)
for word in $(cat $1); do
	if [ $even == "true" ]; then
		subtractor=$word
		printf "%s," $(($word - $subtractor2))
		even="false"
	else
		subtractor2=$word
		printf "%s," $(($word - $subtractor))
		even="true"
	fi
done
	
