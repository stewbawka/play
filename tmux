tmux kill-session -t play
tmux new-session -s play -n server -d
tmux send-keys -t play:1 'cd ~/code/play' C-m
tmux send-keys -t play:1 'skaffold dev' C-m
tmux new-window -n k9s -t play
tmux send-keys -t play:2 'cd ~/code/play' C-m
tmux send-keys -t play:2 'k9s' C-m
tmux new-window -n frontends -t play
tmux send-keys -t play:3 'cd ~/code/play/frontends-root-config' C-m
tmux send-keys -t play:3 'npm run start' C-m
tmux split-window -v -t play:3
tmux send-keys -t play:3.2 'cd ~/code/play/vue-nav' C-m
tmux send-keys -t play:3.2 'npm run serve' C-m
tmux split-window -v -t play:3
tmux send-keys -t play:3.3 'cd ~/code/play/styleguide' C-m
tmux send-keys -t play:3.3 'npm run start' C-m
tmux split-window -v -t play:3
tmux send-keys -t play:3.4 'cd ~/code/play/vue-auth' C-m
tmux send-keys -t play:3.4 'npm run serve' C-m
tmux new-window -n vim -t play
tmux send-keys -t play:3 'cd ~/code/play' C-m
tmux send-keys -t play:3 'vim -N' C-m
tmux attach -t play
