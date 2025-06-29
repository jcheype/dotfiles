#!/usr/bin/env bash

# Session Name
session="Sixense"
tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]; then

  declare -A projects
  projects[backend]="Projects/beyond-monitoring-backend"
  projects[frontend]="Projects/beyond-monitoring-frontend"
  projects[dynamic-viewer]="Projects/beyond-monitoring-dynamic-viewer"
  projects[dynamic-viewer-converter]="Projects/beyond-monitoring-dynamic-viewer-converter"

  # Start New Session with our name
  tmux new-session -d -s $session

  for i in "${!projects[@]}"
  do
    echo "key  : $i"
    echo "value: ${projects[$i]}"
    tmux new-window -n "$i" -c "${projects[$i]}" # \; splitw -c "${projects[$i]}"
  done
fi

tmux attach-session -t $Session:1


