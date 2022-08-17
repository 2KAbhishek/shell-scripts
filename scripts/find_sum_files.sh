#!/usr/bin/env bash

# Check if two arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: $0 file_type search_path"
    exit 1
fi

# Exit if second argument is not a directory
if [ ! -d "$2" ]; then
    echo "Second argument must be a directory"
    exit 1
fi

file_type=$1
search_path=$2

# Find all files of the given file type in the given directory and save in an array
files=($(find "$search_path" -type f -name "$file_type"))

# Count the number of files in the array
count=${#files[@]}

size=0
# Sum file sizes and print the result using for loop
function sum_file_sizes {
for ((i = 0; i < count; i++)); do
    cur_file=${files[$i]}
    # check if file is a regular file
    if [ -f "$cur_file" ]; then
        size=$((size + $(stat -c%s "$cur_file")))
    fi
done
}
sum_file_sizes

# Print the number of files and the total size
echo "Found $count $file_type files under directory $search_path total $size bytes"
