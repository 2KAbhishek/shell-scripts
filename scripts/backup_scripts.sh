#!/usr/bin/env bash

# find all *.sh files and compress them using xz
find . -name "*.sh" -exec xz {} \;
