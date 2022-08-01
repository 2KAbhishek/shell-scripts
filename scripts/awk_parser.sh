#!/usr/bin/env bash

data=$1
# get data between angle brackets using awk
awk -F '[<>]' '{print $2}' "$data"
