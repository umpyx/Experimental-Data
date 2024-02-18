echo ARRAY SQUARE SIZE:
read input


while [ $input -lt 30000 ]
do
	echo ARRAY SIZE: $input >> results7.txtxt
	bash ./thing7.bash &
	PID=$!
	./bad_program $input $input $input $input 
	input=$((input + 1))
	kill -s SIGINT $PID
done

