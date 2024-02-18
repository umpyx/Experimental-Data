echo HERE WE GO!!!
input=21500
echo $input

bash thing3.bash &
pid=$!

echo ARRAY SIZE: $input >> results6.txt
echo -e "spwd\t\tfree\t\tbuff\t\tcache" >> results6.txt
./bad_program $input $input $input $input 
kill -n 15 $pid
