# Standard for creating a logger to be interoperable with Generic-Run.bash

## Execution 

`Generic-Run.bash` can be called once with multiple loggers running in order to parallelize logging in a master script

Arguments to `Generic-Run.bash` are as follows:
1. Inital size of matrix side

2. Maximum size of matrix side

3. File to output when a run finishes, should be same file as logger output in order to separate the data points

4. The interval between array size, i.e. how much the matrix side increases each run

## Data collection

Logger should pipe all output into `Results/$(date '+%Y-%m-%d-%H:%M:%S')[NAME_OF_TEST]`, or should be organized into a subfolder named with the output of the `date` command, thus dropping the date prefix.
