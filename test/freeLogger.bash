#!/bin/env bash
#Logs output of 'free' command 

OUTPUTDIR=$1
LOGINTERVAL=$2
ARRSIZE=$3
ARRSIZEINTERVAL=$4

function SIGUSR1_HANDLE(){
	touch $OUTPUTDIR/freeData.txt
	echo $ARRSIZE\n >> $OUTPUTDIR/freeData.txt
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
}


echo $$ >> PID.txt


trap SIGUSR1_HANDLE SIGUSR1

free -bs $LOGINTERVAL >> $OUTPUTDIR/freeData.txt
