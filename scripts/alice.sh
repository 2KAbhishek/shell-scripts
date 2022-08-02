#!/usr/bin/env bash

file_name=$1

# Use sed to replace data between "*mouse and *mouse" inclusive with "lamb"
sed -i 's/\*mouse and \*mouse/lamb/g' "$file_name"

