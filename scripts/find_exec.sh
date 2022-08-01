#!/usr/bin/env bash

# find all files greater than 200K and print command to delete them
find . -type f -size +200k -exec echo 'rm' {} \;
