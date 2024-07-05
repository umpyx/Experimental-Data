#!/bin/env python

import matplotlib
import matplotlib.pyplot as plt
import argparse
import json

parser = argparse.ArgumentParser(prog="plot.py", description="Matplotlib frontend using JSON line data for graph creation", allow_abbrev=True)
parser.add_argument('--xAxisLabel', default='XAxis', nargs=1)
parser.add_argument('--yAxisLabel', default='YAxis', nargs=1)
parser.add_argument('outputName', help='filename for output image')
parser.add_argument('lineData',   help='path to JSON file containing line data, example file included')
args = parser.parse_args()

with open(args.lineData, 'r') as lineDataFile:
    lineData = json.loads(lineDataFile.read())
    lineDataFile.close

lineNames   = []
lineXValues = []
lineYValues = []

for obj in lineData:
    lineNames.append(lineData[obj]['lineName'])
    lineXValues.append(lineData[obj]['xValues'])
    lineYValues.append(lineData[obj]['yValues'])


i:int = 0
while i < len(lineYValues):
    if lineXValues[i] == []:
        plt.plot(lineYValues[i], label = lineNames[i], marker = 'o')
    else:
        plt.plot(lineXValues[i], lineYValues[i], label = lineNames[i], marker = 'o')
    plt.figlegend()
    i += 1

plt.savefig(args.outputName, bbox_inches = 'tight')

