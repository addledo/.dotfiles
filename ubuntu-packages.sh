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
  tree-sitter-cli
)

sudo apt install -y "${packages[@]}"
