echo HERE WE GO!!!
input=21500
echo $input

bash vmstatLogger.txt &
pid=$!

echo ARRAY SIZE: $input >> Vmstat.txt
echo -e "spwd\t\tfree\t\tbuff\t\tcache" >> Vmstat.txt
./bad_program $input $input $input $input 
kill -n 15 $pid
