#!/bin/env python

import matplotlib
import matplotlib.pyplot as plt
import polars as pl
import argparse
import json

def arrcmp(arr, refArr, fields):
    arrtest1  = []
    arrtest2  = []
    arrnames1 = []
    arrnames2 = []
    for i in arr:
        for j in arr[i]:
            arrnames1.append(j)
            arrtest1.append(arr[i][j].__class__)
    for i in refArr:
        for j in refArr[i]:
            arrnames2.append(j)
            arrtest2.append(refArr[i][j].__class__)
    n=0
    while n < len(arrtest1):
        if (arrtest1[n] != arrtest2[n % fields]) or (arrnames1[n] != arrnames2[n % fields]):
            return False
        n += 1
    return True

if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog="plot.py", description="Matplotlib frontend using JSON line data for graph creation", allow_abbrev=True)
    parser.add_argument('--xAxisLabel', default='XAxis', help="Change the label of the X axis", nargs=1)
    parser.add_argument('--yAxisLabel', default='YAxis', help="Change the label of the Y axis", nargs=1)
    parser.add_argument('outputName', help='filename for output image')
    parser.add_argument('lineData',   help='path to JSON file containing line data, example file included')
    args = parser.parse_args()
    
    with open(args.lineData, 'r') as lineDataFile:
        lineData = json.loads(lineDataFile.read())
        lineDataFile.close
    
    refArrErrorbar = {'class':{  'x': [1,2,3,4], 'y': [2,4,6,8], 'ci' : [1,2,3,4]}}
    refArrNoError  = {'class':{  'x': [1,2,3,4], 'y': [2,4,6,8]}}
    
    if arrcmp(lineData, refArrErrorbar, 3) == False:
        if arrcmp(lineData, refArrNoError, 2) == False:
            print("\033[31;1mMALFORMED JSON\033[m"); exit(1)
        else:
            errorbars = False
    else:
        errorbars = True
    
    dataFrames     = []
    dataFrameNames = []
    
    for i in lineData:
        if errorbars == True:
            tmpdict = {"x" : lineData[i]["x"], "y" : lineData[i]["y"], "ci" : lineData[i]["ci"]}
        else:
            tmpdict = {"x" : lineData[i]["x"], "y" : lineData[i]["y"]}
        dataFrameNames.append(i)
        dataFrames.append(pl.from_dict(tmpdict))
    
    j=0
    for i in dataFrames:
        csvname = "./%s-df.csv" % dataFrameNames[j]
        i.write_csv(csvname)
        if errorbars == True:
            plt.errorbar(pl.Series(i['x']), pl.Series(i['y']), yerr=pl.Series(i['ci']), fmt='-o', label=dataFrameNames[j])
        else:
            plt.plot(pl.Series(i['x']), pl.Series(i['y']), label = dataFrameNames[j], marker='o')
        j+=1

    plt.xlabel(args.xAxisLabel[0])
    plt.ylabel(args.yAxisLabel[0])
    plt.legend()


    plt.savefig(args.outputName, bbox_inches = 'tight')
