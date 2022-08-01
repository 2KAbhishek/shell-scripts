#!/usr/bin/env bash

file_name=$1

# read a csv file and count number of columns in each line and total number of lines
echo "Number of columns in each line:"
for line in $(cat "$file_name"); do
	echo "$line" | awk -F, '{print NF}'
done

echo "Total number of rows:"
awk 'END {print NR}' "$file_name"
