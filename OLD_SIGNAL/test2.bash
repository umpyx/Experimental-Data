read input
running=true
while [ $input -lt 20 ]
do
	./thing $input $input $input $input &
	while [ $running = true ]; do
		free -h >> results8.txt
		sleep 1
		trap running=false SIGUSR1
		echo yea
	done
	input=$((input + 1500))
done
