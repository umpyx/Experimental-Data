while true
do
	vmstat | tail -n 1 >> resultsstev.txt #USED TO BE RESULTS4.txt
	sleep 50
done

