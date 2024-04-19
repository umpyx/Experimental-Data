OUTPUTDIR=$1
LOGINTERVAL=$2
ARRSIZE=$3
ARRSIZEINTERVAL=$4

function SIGUSR1_HANDLE(){
	echo $ARRSIZE\n >> $OUTPUTDIR/iostatData.txt
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
}

trap SIGUSR1_HANDLE SIGUSR1

vmstat >> $OUTPUTDIR/vmstatData.txt
while true; do
	vmstat | tail -n 1 >> $OUTPUTDIR/vmstatData.txt 
	sleep $LOGINTERVAL
done
