tmux kill-session -t play
tmux new-session -s play -n server -d
tmux send-keys -t play:1 'cd ~/code/play' C-m
tmux send-keys -t play:1 'skaffold dev' C-m
tmux new-window -n vim -t play
tmux send-keys -t play:2 'cd ~/code/play' C-m
tmux send-keys -t play:2 'vim -N' C-m
tmux attach -t play
