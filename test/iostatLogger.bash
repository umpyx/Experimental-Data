#! /bin/bash
OUTPUTDIR=$1
LOGINTERVAL=$2

function SIGUSR1_HANDLE(){
	sleep 1
}
function SIGUSR2_HANDLE(){
	running=false
}


running=true
trap SIGUSR1_HANDLE SIGUSR1
trap SIGUSR2_HANDLE SIGUSR2
echo $$ > PID.txt

while [ $running = true ]; do 
	echo R_AWAIT: $(iostat -xz | grep sda | awk '{print $6}') >> $OUTPUTDIR/iostatData.txt
	sleep $LOGINTERVAL
done

