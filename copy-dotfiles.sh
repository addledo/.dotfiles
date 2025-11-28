#! /usr/bin/env bash

dirs=(
  wofi
  waybar
  tmux
  hypr
  zsh
)

cp -R "${dirs[@]}" $XDG_CONFIG_HOME
