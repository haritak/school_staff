#!/bin/sh
cd ~/school_staff/staff
tmux new-session -s staff -d
tmux send-keys -t staff 'cd ~/school_staff/staff' C-m
#tmux send-keys -t staff 'bin/rails server -b 0.0.0.0 -p 4000' C-m
tmux send-keys -t staff 'start_rails_in_production.sh' C-m
tmux new-window -t staff
tmux send-keys -t staff 'mysql school_staff -u root -p' C-m
tmux new-window -t staff
