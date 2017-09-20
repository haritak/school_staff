#!/bin/sh
tmux new-session -s staff -d
tmux send-keys -t staff 'cd ~/school_staff/staff' C-m
tmux send-keys -t staff 'bin/rails server -b 0.0.0.0 -p 4000' C-m
tmux new-window -t staff
