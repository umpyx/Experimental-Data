#Logs output of 'free' command 

OUTPUTDIR=$1
LOGINTERVAL=$2

function SIGUSR1_HANDLE(){
	sleep 1
}
function SIGUSR2_HANDLE(){
	running=false
}


running=true
trap SIGUSR1_HANDLE SIGUSR1
trap SIGUSR2_HANDLE SIGUSR2
echo $$ > PID.txt

while [ $running = true ]; do 
	free -h >> $OUTPUTDIR/freeData.txt
	sleep $LOGINTERVAL
done
