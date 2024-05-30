OUTPUTDIR=$1
LOGINTERVAL=$2
ARRSIZE=$3
ARRSIZEINTERVAL=$4

echo $$ > ./PID.txt

function SIGUSR1_HANDLE(){
	touch $OUTPUTDIR/iostatData.txt
	echo $ARRSIZE\n >> $OUTPUTDIR/iostatData.txt
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
}

trap SIGUSR1_HANDLE SIGUSR1

	sar -B $LOGINTERVAL >> $OUTPUTDIR/sarData.txt
	#used to pipe to awk -v OFS='\t' '{print $5, $6}'
