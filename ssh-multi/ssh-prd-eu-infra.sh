#!/bin/bash

hosts=( prd-eu-infra_az_a_1 prd-eu-infra_az_b_1 prd-eu-infra_az_c_1 )

tmux new-window "ssh ${hosts[0]}"
unset hosts[0];

for i in "${hosts[@]}"; do
    tmux split-window -h  "ssh $i"
done

tmux select-layout even-vertical
tmux select-pane -t 0
tmux set-window-option synchronize-panes on
