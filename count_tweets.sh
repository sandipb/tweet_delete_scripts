#!/bin/bash
cat tweet-headers.js |
  # Remove the "window.YTD.tweet_headers.part0 = " prefix
  sed 's/^window\.YTD\.tweet_headers\.part0 = //' |
  # Parse JSON and extract the created_at field, then get the year
  jq -r '.[] | .tweet.created_at | split(" ")[5]' |
  # Sort the years
  sort |
  # Count occurrences of each year
  uniq -c |
  # Optional: sort by year
  sort -k2n
