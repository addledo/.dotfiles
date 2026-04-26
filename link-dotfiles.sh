#! /usr/bin/env bash

dirs=(
  # wofi
  # waybar
  tmux
  # hypr
  zsh
  ghostty
)

if [[ -z "$XDG_CONFIG_HOME" ]]; then
  read -rp "XDG_CONFIG_HOME not set. Set to ""~/.config""? Y/n" setXdg
  if [[ -z "$setXdg" || "$setXdg" == 'y' ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
  else
    exit 0
  fi
fi


for dir in "${dirs[@]}"; do
  echo  "$XDG_CONFIG_HOME/$dir"
  if [[ -d "$XDG_CONFIG_HOME/$dir" ]]; then
    # Already exists. Prompt user.
    read -rp "$dir exists. Delete? y/N" choice
    if [[ "$choice" == 'y' ]]; then
      echo 'should delete'
    fi
  fi

  ln -sFfn "$(pwd)/$dir" "$XDG_CONFIG_HOME/$dir"
done

