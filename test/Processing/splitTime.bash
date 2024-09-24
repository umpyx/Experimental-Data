#!/bin/bash

STR=$(grep 'ARRAY SIZE' $1)

TIMES=$(printf "%s" "$STR" | awk '{print $1}')
SIZES=$(printf "%s" "$STR" | awk '{print $5}')

ENTRIES=$(printf "%s" "$STR" | wc -l)

printf "%s" "$TIMES" | head -n $(($ENTRIES / 2 + 1)) >> timeyst
printf "%s" "$SIZES" | head -n $(($ENTRIES / 2 + 1)) >> timexst
printf "%s" "$TIMES" | tail -n $(($ENTRIES / 2 + 1)) >> timeymt
printf "%s" "$SIZES" | tail -n $(($ENTRIES / 2 + 1)) >> timexmt
