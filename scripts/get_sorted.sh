#!/bin/bash
# $1: list of input files seprated by space
# $2 : output fil

# Read input files and sort them
echo $1 | tr ' ' '\n' | while read -r fname; do
    sort -k2,3 "$fname"
done >> "$2"
