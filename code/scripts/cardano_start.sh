# create a new tmux session named "cardano_start"
tmux new-session -s ses-0 -n cardano-start -d

# split window horizontally to panels 0 and 1
tmux split-window -h
# split panel 1 horizontally to panels 1 and 2 (left to right)
tmux split-window -v -t 0

# run commands in each pane
tmux send-keys -t 0 'cd ~/cardano' Enter
tmux send-keys -t 0 'cardano-node run \
   --topology topology.json \
   --database-path db/ \
   --socket-path /tmp/node.socket \
   --host-addr 0.0.0.0 \
   --config config.json' Enter

tmux send-keys -t 1 'cd ~/cardano' Enter
tmux send-keys -t 1 'cardano-wallet serve \
   --listen-address 0.0.0.0 \
   --port 8090 \
   --node-socket /tmp/node.socket \
   --testnet byron-genesis.json \
   --database wallet-db \
   --token-metadata-server https://metadata.cardano-testnet.iohkdev.io' Enter
   
tmux send-keys -t 2 "set -o vi" Enter
tmux send-keys -t 2 "htop" Enter

# activate pane 1, bottom right
tmux select-pane -t 2

# compile the end-result on screen
tmux attach-session -t ses-0