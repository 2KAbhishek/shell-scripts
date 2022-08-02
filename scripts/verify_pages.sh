#!/usr/bin/env bash

file_name=$1

# Read json with jq and save url and status to variables
while read -r line; do
    url=$(echo "$line" | jq -r '.url')
    status=$(echo "$line" | jq -r '.status')
    echo "URL: $url"
    echo "Status JSON: $status"
    curl_status=$(curl -s -o /dev/null -w "%{http_code}" $url)
    if [ "$curl_status" != "$status" ]; then
        echo "Status mismatch: $curl_status != $status"
    fi
    echo "----------------------------------------------------"
done <"$file_name"
