OUTPUTDIR=$1
LOGINTERVAL=$2
ARRSIZE=$3
ARRSIZEINTERVAL=$4

function SIGUSR1_HANDLE(){
	echo $ARRSIZE\n >> $OUTPUTDIR/iostatData.txt
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
}

trap SIGUSR1_HANDLE SIGUSR1

while true; do
	sar -B $LOGINTERVAL 5 | awk -v OFS='\t' '{print $5, $6}' >> $OUTPUTDIR/sarData.txt
done
