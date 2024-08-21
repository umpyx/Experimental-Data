ARRSIZE=$1
MAXARRSIZE=$2
OUTPUTFILE=$3
ARRSIZEINTERVAL=$4

echo $$ > ./PID.txt
kill -10 $PPID
printf "Running singlethreaded test\033[;;5m..."
while [ $ARRSIZE -lt $MAXARRSIZE ]; do
	./singlethread_target $ARRSIZE $ARRSIZE $ARRSIZE $ARRSIZE  >> $OUTPUTFILE
	echo $(date '+%H:%M:%S') = ARRAY SIZE: $ARRSIZE >> $OUTPUTFILE 
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
	for word in $(cat PID.txt); do
		kill -10 $word
	done
done

ARRSIZE=$1
printf "Running multithreaded test\033[;;5m..."
while [ $ARRSIZE -lt $MAXARRSIZE ]; do
	kill -10 $PID
	./multithread_target $ARRSIZE $ARRSIZE $ARRSIZE $ARRSIZE >> $OUTPUTFILE
	echo $(date '+%H:%M:%S') = ARRAY SIZE: $ARRSIZE >> $OUTPUTFILE 
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
	for word in $(cat PID.txt); do
		kill -10 $word
	done
done
