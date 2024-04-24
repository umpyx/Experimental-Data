# Standard for creating a logger to be interoperable with Generic-Run.bash

## Execution 

`genericRun.bash` can be called once with multiple loggers running in order to parallelize logging in a master script

Arguments to `genericRun.bash` are as follows:
1. Inital size of matrix side

2. Maximum size of matrix side

3. File to output when a run finishes, should be same file as logger output in order to separate the data points

4. The interval between array size, i.e. how much the matrix side increases each run

## Data collection

Loggers should pipe all output into `Results/$(date '+%Y-%m-%d-%H:%M:%S')/[NAME_OF_TEST].txt`

## Loggers
### biolatencyLogger.bash
Runs the bcc script `biolatency` over the duration of the entire run of a single matrix multiplication

Arguments:

1. Output directory to put output file in

2. The system's path to where the biolatency executable lives (included in the `bcc` package)

3. The initial array size that is being used for the multiplication

4. The difference between each array size

### freeLogger.bash
Logs the output of repeated `free` commands, taking small samples over the duration of the matrix multiplication.

Arguments:

1. The output directory to place the output file in

2. The interval between taking samples, in seconds

3. The initial array size that is being used for the multiplication

4. The difference between each array size

### iostatLogger.bash
Logs the output of the `iostat -xz` command, and filters out for column 6 - R\_AWAIT of disk latency - taking samples

Arguments:

1. The output directory to place the output file in

2. The interval between taking samples, in seconds

3. The initial array size that is being used for the multiplication

4. The difference between each array size

### sarLogger.bash
Logs the output of the `sar` command

Arguments:

1. The output directory to place the output file in

2. The interval between taking samples, in seconds

3. The initial array size that is being used for the multiplication

4. The difference between each array size

### vmstatLogger.bash
Logs memory usage from the `vmstat` command

Arguments:

1. The output directory to place the output file in

2. The interval between taking samples, in seconds

3. The initial array size that is being used for the multiplication

4. The difference between each array size
