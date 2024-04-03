#OLD DONT USE = REPLACED WITH GENERIC-RUN
echo ARRAY SQUARE SIZE:
read input


while [ $input -lt 30000 ]
do
	echo ARRAY SIZE: $input >> Results/UNUSED_BIOLATENCY.txt
	bash ./biolatencyLogger.bash &
	PID=$!
	./bad_program $input $input $input $input 
	input=$((input + 1))
	kill -s SIGINT $PID
done

