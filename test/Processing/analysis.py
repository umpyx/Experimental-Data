#!/bin/env python3

import json
import math
import pandas as pd
import sys

def stdev(popsize:int, mean:int, values:list[int]):
    numerator = 0
    for i in values:
        numerator += ((i - mean) ** 2)
    deviation = math.sqrt(numerator/popsize)
    return deviation

def critlevel(n, level_perc):
    import scipy.stats

    # not the same alpha as in the eqns ...
    alpha = level_perc / 100.0

    if n > 32:
        return scipy.stats.norm.interval(alpha)[1]
    else:
        return scipy.stats.t.interval(alpha, n - 1)[1]

def calc_ci(stdev, n, level_perc):
    t1 = critlevel(n, level_perc)
    se = stdev / math.sqrt(n)
    zt = t1*se
    
    return zt # error range (1 direction)

def mean(numbers:list[int]):
    return sum(numbers)/len(numbers)

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
        if arrtest1[i] != arrtest2[i % 2]:
            return False
        i += 1
    return True

#assumes all the entries in input.json are to be processed

if __name__ == "__main__":
    with open(sys.argv[1]) as inputFile:
        inputDict = json.loads(inputFile.read())
    inputFile.close()
    
    refArr = {'class':{'x':[1,2,3,4],'y':[1,2,3,4]}}
    if arrcmp(inputDict, refArr) == False:
        print("\033[31;1mMALFORMED JSON\033[m"); exit(1)
    
    for i in inputDict:
        name = i
        break
    Values = []
    means = []
    ConfidenceIntervals = []
    xes = []

    for i in inputDict:
        n=0
        if xes == []:
            xes = inputDict[i]["x"]
        while n < len(inputDict[i]["y"]):
            try: 
                Values[n].append(inputDict[i]["y"][n])
            except:
                Values.append([inputDict[i]["y"][n]])
            n+=1

    n=0
    for i in Values:
        tmpmean = mean(i)
        ConfidenceIntervals.append(calc_ci(
            stdev(len(i), tmpmean, i),
            len(i),
            95
            ))
        n+=1
        means.append(tmpmean)

    print("\"%s\" : {\n\t\"x\" : %s,\n\t\"y\" : %s,\n\t\"ci\" : %s\n}," % (name, xes, means, ConfidenceIntervals))

