logger=$1
arrsize=$1

exec ./$logger &

sleep 1
PID=$(cat PID.txt)
echo $PID

kill -10 $PID
while [ $input -lt 33000 ]
do
	kill -10 $PID
	echo ARRAY SIZE: $arrsize >> Results/Iostat.txt
	./bad_program $arrsize $arrsize $arrsize $arrsize 
	arrsize=$((input + 1500))
done
