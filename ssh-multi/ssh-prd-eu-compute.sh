#!/bin/bash

hosts=( prd-eu-compute_az_a_h12 prd-eu-compute_az_a_h13 prd-eu-compute_az_b_h12 prd-eu-compute_az_b_h13 prd-eu-compute_az_c_h12 prd-eu-compute_az_c_h13 )

tmux new-window "ssh ${hosts[0]}"
unset hosts[0];

for i in "${hosts[@]}"; do
    tmux split-window -h  "ssh $i"
    tmux select-layout tiled
done

tmux select-layout tiled
tmux select-pane -t 0
tmux set-window-option synchronize-panes on
