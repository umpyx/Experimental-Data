# Logs data from biolatency eBPF tool to 

OUTPUTDIR=$1
PATHTOBCC=$2

sudo $PATHTOBCC/tools/biolatency.py -m 2>&1 >> Results/$OUTPUTFILE/biolatencyData.txt
