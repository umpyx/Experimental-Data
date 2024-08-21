for word in $(cat $1); do
	tmp=$(($word - 3608))
	printf "%s," "$tmp" >> newOutput.txt
done
