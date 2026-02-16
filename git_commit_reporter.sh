#!/bin/bash

# Gitのログを１日ごとにDiffごと書き出す

start_date="2025-09-10"
end_date="2025-09-15"

current_date=$start_date

while [ "$current_date" != "$end_date" ]; do
  echo "$current_date"

  count=git log \
    --since "$current_date 00:00:00" \
    --until "$current_date 23:59:59" \
    | wc -l 

  current_date="$(date -v+1d -j -f "%Y-%m-%d" "$current_date" "+%Y-%m-%d" )"

done

