#MASTER SCRIPT TO SPAWN ALL LOGGERS AND RUN TARGET PROGRAM

EXPECTED_ARGS=6

TESTS_NAME=$1
OUTPUTDIR=Results/$(date '+%Y-%m-%d-%H:%M:%S-')$TESTS_NAME
#USED IN EXPERIMENT: 
TIMEINTERVAL=$2
#USED IN EXPERIMENT: 
ARRSIZEINTERVAL=$3 #1500 is a nice balance
#USED IN EXPERIMENT: 
MAXARRSIZE=$5 
#USED IN EXPERIMENT: 
INITARRSIZE=$6
#USED IN EXPERIMENT: 
PATHTOBCC=$7

#if [ $# -ne EXPECTED_ARGS ]; then
	#echo INVALID NUMBER OF ARGUMENTS: EXPECTED $EXPECTED_ARGS, GOT $#
#fi

echo ' ' > PID.txt #Clear PID list 

bash genericRun.bash $INITARRSIZE $MAXARRSIZE $OUTPUTDIR/timeData.txt $ARRSIZEINTERVAL &
bash biolatencyLogger.bash $OUTPUTDIR $PATHTOBCC $INITARRSIZE $ARRSIZEINTERVAL &
bash freeLogger.bash $OUTPUTDIR $TIMEINTERVAL $INITARRSIZE $ARRSIZEINTERVAL &
bash iostatLogger.bash $OUTPUTDIR $TIMEINTERVAL $INITARRSIZE $ARRSIZEINTERVAL &
bash sarLogger.bash $OUTPUTDIR $TIMEINTERVAL $INITARRSIZE $ARRSIZEINTERVAL &
bash vmstatLogger.bash $OUTPUTDIR $TIMEINTERVAL $INITARRSIZE $ARRSIZEINTERVAL&
