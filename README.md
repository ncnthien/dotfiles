# Dotfiles of ncnthien

## Prerequisite
- [alacritty](https://alacritty.org/)
- [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- [node](https://nodejs.org/en/download)
- [git](https://git-scm.com/downloads)
- [omz](https://ohmyz.sh/)
- [tmux](https://github.com/tmux/tmux/wiki/Installing)
- [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

## Installation
- Clone the repo first:
```
git clone git@github.com:ncnthien/dotfiles.git ~/
```

- Go into the directory:
```
cd ~/dotfiles
```

- Run the script to create symbolic links:
```
chmod +x ./install.sh
bash ./install.sh
```

## Troubleshooting
#### My nvim does not work anymore?
- We change the alias in `.zshrc`, use `v` instead of `nvim` to open neovim.

#### My Github Copilot does not work?
- After install all prerequisite parts and run the script, open nvim, and run `:Copilot auth` to start authentication process.

Please feel free to create an issue if there is any issue to this repo
