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

# Install external oh-my-zsh plugins referenced in .zshrc
# (oh-my-zsh does not bundle these; they must be cloned into custom/plugins).
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] || \
  git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ -d "$ZSH_CUSTOM/plugins/zsh-nvm" ] || \
  git clone --depth 1 https://github.com/lukechilds/zsh-nvm "$ZSH_CUSTOM/plugins/zsh-nvm"

# Install TPM (tmux plugin manager), required by .tmux.conf.
[ -d "$HOME/.tmux/plugins/tpm" ] || \
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
