echo ARRAY SQUARE SIZE:
read input

bash sarLogger.bash &
#sudo bash cachestatLogger.bash &

while [ $input -lt 33000 ]
do
	#echo ARRAY SIZE: $input >> Results/Sar-8G.txt
	echo ARRAY SIZE: $input >> Results/Sar-3G.txt
	#echo ARRAY SIZE: $input >> Results/Cachestat.txt
	./bad_program $input $input $input $input 
	input=$((input + 1500))
done
