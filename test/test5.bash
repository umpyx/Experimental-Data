echo ARRAY SQUARE SIZE:
read input

bash thing1.bash &
#sudo bash thing2.bash &

while [ $input -lt 33000 ]
do
	echo ARRAY SIZE: $input >> resultsSar3G.txt
	#echo ARRAY SIZE: $input >> results5-2.txt
	./bad_program $input $input $input $input 
	input=$((input + 1500))
done
