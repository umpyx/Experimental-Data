#!/bin/env bash

EXPECTED_ARGS=4
if (($# != $EXPECTED_ARGS)); then
	printf "\033[31;1mERROR: INCORRECT NUMBER OF ARGS\033[m\n"
	echo "USAGE: constructJSON.bash [LINE NAME] [X VALUES FILE] [Y VALUES FILE] [OUTPUT FILE]"
	echo "\"AUTOFILL\" can be used for X values to automaticall filll by 1s to match the count of y values"
	exit 1
fi

LINENAME=$1
YVALUES=$(cat $3)
OUTPUTFILE=$4

if [ $2 == "AUTOFILL" ]; then 
	IFS=","
	counter=0
	for word in $YVALUES; do
		counter=$(($counter + 1))
	done
	i=0
	XVALUES=$i
	i=$(($i+1))
	while (( $i < $counter )); do
		XVALUES="$XVALUES,$i"
		i=$(($i + 1))
	done
else
	XVALUES=$(cat $2)
fi



if [[ ! -e $OUTPUTFILE ]]; then
	printf "{\n" > $OUTPUTFILE
else
	printf ",\n" >> $OUTPUTFILE
fi

printf "\"%s\": {\n\t\"x\" : [%s],\n\t\"y\" : [%s]\n}" "$LINENAME" "$XVALUES" "$YVALUES" >> $OUTPUTFILE
