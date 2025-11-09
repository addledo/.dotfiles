#!/usr/bin/env bash

# Exit if command fails
set -e

echo "Sourcing packages to install"
source "./packages.sh"

echo "Updating pacman"
sudo pacman -Syu

echo "Installing packages"
sudo pacman -S --needed "${packages[@]}"
