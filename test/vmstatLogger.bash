while true
do
	vmstat | tail -n 1 >> Results/TimeAndVmstat.txt #USED TO BE Results/Iostat.txt
	sleep 50
done

