#! /bin/bash
#OLD - DON'T USE

#Automated testing of program with high swap usage


read input
while [ $input -lt 40000 ]
do
	echo ARRAY SIZE $input >> Results/TimeAndVmstat.txt
	bash vmstatLogger.bash & #THIS IS NEW
	{ time ./bad_program $input $input $input $input ; } 2>> Results/Time-3G-1.33RAM.txt
	printf "\n\n" >> Results/TimeAndVmstat.txt
	input=$((input + 1500))
done
