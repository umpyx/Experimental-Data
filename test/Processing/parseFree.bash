#!/bin/env bash
BASICSTR=$(awk -v OFS='\t' '{ print $3, $4 }' $1 | grep -v free)

i=0
for word in $BASICSTR
do
	case $i in
		0) 
			printf "%s," "$word" >> usedMem.txt
			i=$((i+1))
			;;
		1) 
			printf "%s," "$word" >> freeMem.txt
			i=$((i+1))
			;;
		2) 
			printf "%s," "$word" >> usedSwap.txt
			i=$((i+1))
			;;
		3) 
			printf "%s," "$word" >> freeSwap.txt
			i=0
			;;
	esac
done
