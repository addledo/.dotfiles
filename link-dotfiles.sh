#! /usr/bin/env bash

dirs=(
  # wofi
  # waybar
  tmux
  # hypr
  zsh
  ghostty
)

# cp -R "${dirs[@]}" $XDG_CONFIG_HOME

for dir in "${dirs[@]}"; do
  ln -sFfn "$(pwd)/$dir" "$XDG_CONFIG_HOME/$dir"
done
