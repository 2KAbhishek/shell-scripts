#!/usr/bin/env bash

# Read url from stdin
url=$1

# download with curl five at a time using parallel command
echo "$url" | parallel -j5 curl -O -L --retry 5 --retry-max-time 120 {}

