echo ARRAY SQUARE SIZE:
read input

exec ./iostat-logger.bash &

sleep 1
PID=$(cat PID.txt)
echo $PID

kill -10 $PID
while [ $input -lt 33000 ]
do
	kill -10 $PID
	echo ARRAY SIZE: $input >> Results/Iostat.txt
	./bad_program $input $input $input $input 
	input=$((input + 1500))
done
