#! /usr/bin/env bash

echo "Copy dotfiles"
./copy-dotfiles.sh

echo "Install packages"
./install.sh

echo "Setup tmux sessionizer"
pushd tmux > /dev/null
  ./tmux-setup.sh
popd > /dev/null

