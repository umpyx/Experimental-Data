#!/bin/env bash
# Logs data from biolatency eBPF tool to $OUTPUTDIR

OUTPUTDIR=$1
PATHTOBCC=$2
ARRSIZE=$3
ARRSIZEINTERVAL=$4

function SIGUSR1_HANDLE(){
	echo $ARRSIZE\n >> $OUTPUTDIR/biolatencyData.txt
	ARRSIZE=$(($ARRSIZE + $ARRSIZEINTERVAL))
}

trap SIGUSR1_HANDLE SIGUSR1

sudo $PATHTOBCC/tools/biolatency.py -m 2>&1 >> $OUTPUTDIR/biolatencyData.txt
