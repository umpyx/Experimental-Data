#!/bin/env bash

SWAPDRIVE=$(swapon | tail -n 1 | awk '{ print $1 }' | sed 's/\/.*\///' | head -c -2)
BASICSTR=$(grep -T "$SWAPDRIVE\|ARRSIZE" $1  | awk '{if (NF==2){print $1, $2} else {print $6}}')

FILENAME=TRASH.txt
readArraySize="false"
for word in $BASICSTR
do
	printf "$word"
	case $word in
		"#ARRSIZE:")
			printf "\033[31mWe got here!\033[m\n"
			readArraySize="true"
			;;
		*)
			if [ "$readArraySize" = "true" ] ; then
				FILENAME="$word"-R_AWAIT.txt
				readArraySize="false"
			else
				printf "%s," "$word" >> $FILENAME
			fi
			;;
	esac

done
