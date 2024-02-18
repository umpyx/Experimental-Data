#! /bin/bash

#Automated testing of program with high swap usage


read input
while [ $input -lt 30000 ]
do
	echo ARRAY SIZE $input >> resultsstev.txt
	bash thing3.bash & #THIS IS NEW
	{ time ./bad_program $input $input $input $input ; } 2>> resultsstev.txt
	printf "\n\n" >> resultsstev.txt
	input=$((input + 1500))
done
