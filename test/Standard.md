# Standard for creating a logger to be interoperable with Generic-Run.bash

## Execution 

Logger should cal and pass $1 and $2 to `Generic-Run.bash`

## Data collection

Logger should pipe all output into `Results/$(date '+%Y-%m-%d-%H:%M:%S)[NAME_OF_TEST]`, or should be organized into a subfolder named with the output of the `date` command, thus dropping the date prefix.
