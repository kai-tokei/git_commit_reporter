#!/bin/bash

# Gitのログを１日ごとにDiffごと書き出す

start_date="2026-01-10"
end_date="2026-02-28"

current_date=$start_date

while [ "$current_date" != "$end_date" ]; do
  # echo "$current_date"

  count=$(git log \
    --since "$current_date 00:00:00" \
    --until "$current_date 23:59:59" \
    | wc -l) 
  
  if [ "$count" -gt 0 ]; then
    git log \
    --since "$current_date 00:00:00" \
    --until "$current_date 23:59:59" \
    -p --stat > "${current_date}.txt"
  fi

  current_date="$(date -v+1d -j -f "%Y-%m-%d" "$current_date" "+%Y-%m-%d" )"

done

