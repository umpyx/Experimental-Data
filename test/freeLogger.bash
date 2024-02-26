echo ARRAY SIZE: $1 >> Results/FreeResults2.txt
while true; do
	free -h >> Results/FreeResults2.txt
	sleep 500
done
