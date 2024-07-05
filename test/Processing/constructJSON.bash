#!/bin/env bash

EXPECTED_ARGS=4
if (($# != $EXPECTED_ARGS)); then
	printf "\033[31;1mERROR: INCORRECT NUMBER OF ARGS\033[m\n"
	echo "USAGE: constructJSON.bash [LINE NAME] [X VALUES FILE] [Y VALUES FILE] [OUTPUT FILE]"
	exit 1
fi

LINENAME=$1
XVALUES=$(cat $2)
YVALUES=$(cat $3)
OUTPUTFILE=$4


if [[ ! -e $OUTPUTFILE ]]; then
	printf "{\n" > $OUTPUTFILE
	NUMBER=1
else
	printf ",\n" >> $OUTPUTFILE
	NUMBER=$(($(grep ": {" $OUTPUTFILE | wc -l) + 1))
fi


printf "\"Line %s\": {\n\t\"lineName\": \"%s\",\n\t\"xValues\" : [%s],\n\t\"yValues\" : [%s]\n}" "$NUMBER" "$LINENAME" "$XVALUES" "$YVALUES" >> $OUTPUTFILE
