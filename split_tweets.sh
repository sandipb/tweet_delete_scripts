#!/bin/bash

# First, let's create a working copy of the data without the JS wrapper
sed 's/^window\.YTD\.tweet_headers\.part0 = //' tweet-headers.js >tweets.json

# Get unique years
years=$(jq -r '.[] | .tweet.created_at | split(" ")[5]' tweets.json | sort -u)

# For each year
for year in $years; do
  # Create a new file with the filtered data, maintaining exact format
  printf 'window.YTD.tweet_headers.part0 = ' >"tweet_headers_${year}.js"
  jq --arg year "$year" \
    --compact-output \
    '[.[] | select(.tweet.created_at | split(" ")[5] == $year)]' \
    tweets.json >>"tweet_headers_${year}.js"
done

# Clean up temporary file
rm tweets.json
