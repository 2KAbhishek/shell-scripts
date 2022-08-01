#!/usr/bin/env bash

# Use ping to check which IP addresses in a range of hosts in /24 subnet are alive
subnet=$1

for i in $(seq 255);
do
 ping -W 1 -c 1 $subnet.$i | grep 'from' &
done

