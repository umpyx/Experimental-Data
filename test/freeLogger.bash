#!/bin/env bash
#Logs output of 'free' command 

OUTPUTDIR=$1
LOGINTERVAL=$2
ARRSIZE=$3
ARRSIZEINTERVAL=$4

function SIGUSR1_HANDLE(){
	echo $ARRSIZE\n >> $OUTPUTDIR/freeData.txt
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
}


echo $$ >> PID.txt

running=true

trap SIGUSR1_HANDLE SIGUSR1

while [ $running = true ]; do 
	free -h >> $OUTPUTDIR/freeData.txt
	sleep $LOGINTERVAL
done
