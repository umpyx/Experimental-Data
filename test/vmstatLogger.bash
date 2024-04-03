OUTPUTDIR=$1
LOGINTERVAL=$2

while true; do
	vmstat | tail -n 1 >> $OUTPUTDIR/vmstatData.txt 
	sleep 50
done

