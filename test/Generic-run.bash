ARRSIZE=$1
MAXARRSIZE=$2
OUTPUTFILE=$3
ARRSIZEINTERVAL=$4

echo $$ > ./PID.txt
kill -10 $PPID
while [ $ARRSIZE -lt $MAXARRSIZE ]; do
	echo $(date '+%H:%M:%S') = ARRAY SIZE: $ARRSIZE >> $OUTPUTFILE 
	./singlethread_target $ARRSIZE $ARRSIZE $ARRSIZE $ARRSIZE 
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
	for word in $(cat PID.txt); do
		kill -10 $word
	done
done

ARRSIZE=$1
while [ $ARRSIZE -lt $MAXARRSIZE ]; do
	kill -10 $PID
	echo $(date '+%H:%M:%S') = ARRAY SIZE: $ARRSIZE >> $OUTPUTFILE 
	./multithread_target $ARRSIZE $ARRSIZE $ARRSIZE $ARRSIZE 
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
	for word in $(cat PID.txt); do
		kill -10 $word
	done
done
