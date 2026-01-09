#! /usr/bin/env bash

dirs=(
  wofi
  waybar
  tmux
  hypr
  zsh
  tmux
  ghostty
)

cp -R "${dirs[@]}" $XDG_CONFIG_HOME
