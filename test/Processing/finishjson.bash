#!/bin/bash

INPUT=$(head -c -1 $1)

printf "%s\n}" "$INPUT" > $1
