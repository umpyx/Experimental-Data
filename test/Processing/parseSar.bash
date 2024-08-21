#!/bin/env bash

BASICSTR=$(cat $1 | awk -v OFS='\t' '{print $5, $6}' | tail -n +4)

RAW=$(printf "%s" "$BASICSTR" | head -n -4)
STATS=$(printf "%s" "$BASICSTR" | tail -n 3)


printf "%s" "$STATS" >> sarStats.txt

column=1
for word in $RAW; do
	if (( $column == 1 )); then
		printf "%s," "$word" >> minFaults.txt
		column=2
	else
		printf "%s," "$word" >> majFaults.txt
		column=1
	fi
done

tmpstr=$(head -c -1 minFaults.txt)
printf "%s" "$tmpstr" > minFaults.txt
tmpstr=$(head -c -1 majFaults.txt)
printf "%s" "$tmpstr" > majFaults.txt
