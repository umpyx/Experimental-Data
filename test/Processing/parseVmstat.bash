#!/bin/env bash
BASICSTR=$(awk -v OFS='\t' '{print $3, $4, $5, $6, $7, $8, $16, $20}' $1 | tail -n +3)

i=0
for word in $BASICSTR; do
	case $i in
		0):
			printf "%s," "$word" >> vmstat-swpd.txt
			;;
		1):
			printf "%s," "$word" >> vmstat-free.txt
			;;
		2):
			printf "%s," "$word" >> vmstat-buff.txt
			;;
		3):
			printf "%s," "$word" >> vmstat-cache.txt
			;;
		4):
			printf "%s," "$word" >> vmstat-si.txt
			;;
		5):
			printf "%s," "$word" >> vmstat-so.txt
			;;
		6):
			printf "%s," "$word" >> vmstat-waitingPID.txt
			;;
		7):
			printf "%s," "$word" >> timestamps.txt
			i=-1
			;;
	esac
	i=$(($i+1))
done
