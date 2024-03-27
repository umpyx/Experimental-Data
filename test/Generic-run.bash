arrsize=$1
maxarrsize=$2
outputfile=$3
interval=$4

kill -10 $PPID
while [ $input -lt $maxarrsize ]
do
	kill -10 $PID
	echo ARRAY SIZE: $arrsize >> $3
	./bad_program $arrsize $arrsize $arrsize $arrsize 
	arrsize=$((input + $interval))
done
