#!/bin/bash

hosts=( prd-eu-platform_az_a_1 prd-eu-infra_az_a_1 prd-eu-platform_az_b_1 prd-eu-infra_az_b_1 prd-eu-platform_az_c_1 prd-eu-infra_az_c_1 )

tmux new-window "ssh ${hosts[0]}"
unset hosts[0];

for i in "${hosts[@]}"; do
    tmux split-window "ssh $i"
    tmux select-layout tiled
done

tmux select-layout tiled
tmux select-pane -t 0
tmux set-window-option synchronize-panes on
