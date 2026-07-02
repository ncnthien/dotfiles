#!/bin/bash

# Ensure ~/.config exists as a real directory (not a symlink),
# otherwise `ln -s ... ~/.config` would turn ~/.config itself into a symlink.
mkdir -p ~/.config

# -s symbolic, -f force overwrite, -n treat existing symlinked dir as a file
# (prevents links being created *inside* an existing symlinked target).
ln -sfn ~/dotfiles/alacritty ~/.config/alacritty
ln -sfn ~/dotfiles/nvim ~/.config/nvim

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.aerospace.toml ~/.aerospace.toml
