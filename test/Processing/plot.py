#!/bin/python
import matplotlib
import matplotlib.pyplot as plt
import sys

MINARGS = 6
USAGEMESSAGE = "USAGE: plot.py [X AXIS LABEL] [Y AXIS LABEL] [LINE 1 X VALUES] [LINE 1 Y VALUES] [LINE 1 LABEL] ... [OUTPUT GRAPH NAME]\n\n[X VALUES] and [Y VALUES] are comma-separated strings of numbers, or \"FILE={FILENAME}\"\n\nEXAMPLE:\n\tplot.py \"X_AXIS_LABEL\" \"Y_AXIS_LABEL\" \"1,2,3,4\" \"FILE=YVALUES.txt\" \"LINE1\" \"OUTPUT_NAME_WITH_EXTENSION\""

def charAr2Int(inpt):
    a = len(inpt) - 1
    b = 0
    result = 0
    for i in inpt:
        result += int(inpt[a]) * (10**(b))
        a -= 1
        b += 1
    return result

def convertCSV2Arr(inpt):
    OUTPUT = []
    tmpArr = []
    i = 0
    while True:
        if i == len(inpt):
            OUTPUT.append(charAr2Int(tmpArr))
            break
        elif inpt[i] == ",":
            OUTPUT.append(charAr2Int(tmpArr))
            tmpArr = []
        elif inpt[i] == "\n":
            OUTPUT.append(charAr2Int(tmpArr))
            break
        else:
            tmpArr.append(inpt[i])
        i += 1
    return OUTPUT

def procArg(arg):
    if arg[:5] == "FILE=":
        filename = arg[5:]
        with open(filename, 'r') as TMPFILE:
            TMPSTR = TMPFILE.read()
            TMPFILE.close()
            return convertCSV2Arr(TMPSTR)
    else:
        return convertCSV2Arr(arg)

if __name__ == "__main__":

    if len(sys.argv) - 1 < MINARGS:
        print(USAGEMESSAGE)
        exit(1)



    plt.xlabel(sys.argv[1])
    plt.ylabel(sys.argv[2])


    plotXvalues = []
    plotYvalues = []
    plotLabels  = []
    lineIndex = 3
    tmpCounter = 0
    while lineIndex < len(sys.argv) - 1:
        if tmpCounter == 0:
            plotXvalues.append(procArg(sys.argv[lineIndex]))
        elif tmpCounter == 1: 
            plotYvalues.append(procArg(sys.argv[lineIndex]))
        elif tmpCounter == 2:
            plotLabels.append(sys.argv[lineIndex])
            tmpCounter = -1
        lineIndex += 1
        tmpCounter += 1
    i = 0
    while i < len(plotXvalues):
        plt.plot(plotXvalues[i], plotYvalues[i], label = plotLabels[i], marker = 'o')
        plt.figlegend()
        i += 1

    plt.savefig(sys.argv[(len(sys.argv) - 1)], bbox_inches = 'tight')

    #The End :)
