echo ARRAY SQUARE SIZE:
read input

exec ./test4.bash &

sleep 1
PID=$(cat PID.txt)
echo $PID

kill -10 $PID
while [ $input -lt 33000 ]
do
	kill -10 $PID
	echo ARRAY SIZE: $input >> results4.txt
	./bad_program $input $input $input $input 
	input=$((input + 1500))
done
