while true
do
	sar -B 3 5| awk -v OFS='     ' '{print $5, $6}' >> Results/Sar-3G.txt
done
