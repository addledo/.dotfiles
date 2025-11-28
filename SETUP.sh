#! /usr/bin/env bash

#./install.sh

echo "Setup tmux sessionizer"
pushd tmux > /dev/null
  ./tmux-setup.sh
popd > /dev/null
 
dirs=(
  wezterm
  wofi
  waybar
  tmux
)

# cp -R "${dirs[@]}" ~/.config

#mkdir -p ~/.config/wezterm/ && cp -f ./-sessionizer $_
