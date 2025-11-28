#! /usr/bin/env bash

dirs=(
  wofi
  waybar
  tmux
)

cp -R "${dirs[@]}" $XDG_CONFIG_HOME
