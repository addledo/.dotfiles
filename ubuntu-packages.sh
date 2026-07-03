#! /usr/bin/env bash

packages=(
  eza
  starship
  zoxide
  bat
  lazygit
  btop
  fd-find
  ripgrep
  tmux
  fonts-jetbrains-mono
  unzip
)

sudo apt install -y "${packages[@]}"
