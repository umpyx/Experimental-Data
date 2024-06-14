#!/bin/python
import matplotlib
import matplotlib.pyplot as plt
import sys


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

def procArg(arg, AXISVALUES):
    if arg[0] == "F" and arg[1] == "I" and arg[2] == "L" and arg[3] == "E" and arg[4] == "=":
        filename = arg[5:]
        with open(filename, 'r') as TMPFILE:
            TMPSTR = TMPFILE.read()
            AXISVALUES.append = convertCSV2Arr(XSTR)
            TMPFILE.close()
    else:
        AXISVALUES.append = convertCSV2Arr(sys.argv[1])

if __name__ == "__main__":

    print("USAGE: plot.py [X AXIS VALUES] [X AXIS LABEL] [Y AXIS VALUES] [Y AXIS LABEL] [OUTPUT GRAPH NAME]\nXVALUES and YVALUES can be comma-separated strings of numbers, or \"FILE={FILENAME}\"\n\nEXAMPLE:\n\tplot.py 1,2,3,4 X_AXIS_LABEL 2,4,6,8 Y_AXIS_LABEL OUTPUT_NAME_WITH_EXTENSION\n\tplot.py FILE=XVALUES  X_AXIS_LABEL FILE=YVALUE Y_AXIS_LABEL OUTPUT_NAME_WITH_EXTENSION\n\tplot.py FILE=XVALUES X_AXIS_LABEL 2,4,6,8 Y_AXIS_LABEL OUTPUT_NAME_WITH_EXTENSION\n\tplot.py 1,2,3,4 X_AXIS_LABEL FILE=YVALUES Y_AXIS_LABEL OUTPUT_NAME_WITH_EXTENSION")



    if sys.argv[1][0] == "F" and sys.argv[1][1] == "I" and sys.argv[1][2] == "L" and sys.argv[1][3] == "E" and sys.argv[1][4] == "=":
        workingstr = sys.argv[1][5:]
        with open(workingstr, 'r') as XFILE:
            XSTR = XFILE.read()
            XVALUES = convertCSV2Arr(XSTR)
            XFILE.close()
    else:
        XVALUES = convertCSV2Arr(sys.argv[1])
    


    if sys.argv[3][0] == "F" and sys.argv[3][1] == "I" and sys.argv[3][2] == "L" and sys.argv[3][3] == "E" and sys.argv[3][4] == "=":
        workingstr = sys.argv[3][5:]
        with open(workingstr, 'r') as YFILE:
            YSTR = YFILE.read()
            YVALUES = convertCSV2Arr(YSTR)
    else:
        YVALUES = convertCSV2Arr(sys.argv[3])
            

    print(XVALUES, "\n", YVALUES)


    plt.xlabel(sys.argv[2])
    plt.ylabel(sys.argv[4])
    lineIndex = 5
    while lineIndex < len(sys.argv) - 2:
        if lineIndex % 2 == 1:
            procArg(sys.argv[lineIndex], plotXvalues)
        else: 
            procArg(sys.argv[lineIndex], plotYvalues)

    i = 0
    while i < len(XVALUES):
        plt.plot(plotXvalues[i], plotYvalues[i], marker = 'o')

    plt.savefig((len(sys.argv) - 1), bbox_inches = 'tight')
