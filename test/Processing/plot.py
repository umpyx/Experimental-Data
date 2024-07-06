#!/bin/env python

import matplotlib
import matplotlib.pyplot as plt
import argparse
import json

def arrcmp(arr, refArr):
    arrtest1 = []
    arrtest2 = []
    for i in arr:
        for j in arr[i]:
            arrtest1.append(arr[i][j].__class__)
    for i in refArr:
        for j in refArr[i]:
            arrtest2.append(refArr[i][j].__class__)
    i=0
    while i < len(arrtest1):
        if arrtest1[i] != arrtest2[i % 3]:
            return False
        i += 1
    return True

parser = argparse.ArgumentParser(prog="plot.py", description="Matplotlib frontend using JSON line data for graph creation", allow_abbrev=True)
parser.add_argument('--xAxisLabel', default='XAxis', help="Change the label of the X axis", nargs=1)
parser.add_argument('--yAxisLabel', default='YAxis', help="Change the label of the Y axis", nargs=1)
parser.add_argument('outputName', help='filename for output image')
parser.add_argument('lineData',   help='path to JSON file containing line data, example file included')
args = parser.parse_args()

with open(args.lineData, 'r') as lineDataFile:
    lineData = json.loads(lineDataFile.read())
    lineDataFile.close

refArr = {'class':{ 'lineName': "exampleStr", 'xValues': [1,2,3,4], 'yValues': [2,4,6,8]}}
lineNames   = []
lineXValues = []
lineYValues = []

if arrcmp(lineData, refArr) == False:
    print("\033[31;1m MALFORMED JSON"); exit(1)
for obj in lineData:
    lineNames.append(lineData[obj]['lineName'])
    lineXValues.append(lineData[obj]['xValues'])
    lineYValues.append(lineData[obj]['yValues'])

print(args.xAxisLabel)

i:int = 0
plt.xlabel(args.xAxisLabel[0])
plt.ylabel(args.yAxisLabel[0])

while i < len(lineYValues):
    if lineXValues[i] == []:
        plt.plot(lineYValues[i], label = lineNames[i], marker = 'o')
    else:
        plt.plot(lineXValues[i], lineYValues[i], label = lineNames[i], marker = 'o')
    plt.figlegend()
    i += 1

plt.savefig(args.outputName, bbox_inches = 'tight')

