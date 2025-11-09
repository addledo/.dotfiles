#! /usr/bin/env bash

#./install.sh

# mkdir -p ~/.config/tmux-sessionizer/ && cp -f ./tmux-sessionizer.conf $_
# mkdir -p ~/.local/scripts/ && cp -f ./tmux-sessionizer $_
 
dirs=(wezterm wofi)

cp -R "${dirs[@]}" ~/.config

#mkdir -p ~/.config/wezterm/ && cp -f ./-sessionizer $_
