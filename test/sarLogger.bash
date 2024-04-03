OUTPUTDIR=$1

while true; do
	sar -B 3 5 | awk -v OFS='\t' '{print $5, $6}' >> $OUTPUTDIR/sarData.txt
done
