#! /bin/bash
OUTPUTDIR=$1
LOGINTERVAL=$2
ARRSIZE=$3
ARRSIZEINTERVAL=$4

function SIGUSR1_HANDLE(){
	echo $ARRSIZE\n >> $OUTPUTDIR/iostatData.txt
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
}

running=true
trap SIGUSR1_HANDLE SIGUSR1

echo $$ >> PID.txt

	#echo R_AWAIT: $(iostat -xz | grep sda | awk '{print $6}') >> $OUTPUTDIR/iostatData.txt
iostat -xzt $LOGINTERVAL >> $OUTPUTDIR/iostatData.txt
