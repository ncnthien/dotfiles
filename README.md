# Dotfiles of ncnthien

## Overview
A modern and AI-enhanced development environment featuring carefully curated tools and configurations:

### Editor - Neovim
- **AI Assistance**
  - GitHub Copilot for intelligent code completion
  - Avante.nvim for AI-powered coding assistance (powered by Claude 3.7)
- **Development Tools**
  - LSP integration for code intelligence
  - Treesitter for better syntax highlighting
  - Fugitive for Git operations
  - Gitsigns for inline git information
  - DiffView for detailed git diffs
  - Obsidian integration for note-taking
- **Navigation & Search**
  - Flash.nvim for efficient code navigation
  - Grapple for quick file switching
  - Telescope for fuzzy finding
- **Database Management**
  - Dadbod UI for database interactions
- **Aesthetics**
  - Kanagawa and Nightfox color schemes
  - Custom statusline configuration
  - Blink.nvim for cursor animations

### Terminal Setup
- **Alacritty** - A fast, GPU-accelerated terminal emulator
  - Custom color schemes (Kanagawa Dragon theme)
  - Optimized performance settings

### Window Management
- **Sketchybar** - A highly customizable macOS status bar
  - Clean and minimal design
  - System information display

## Key Features
- Fully modular Neovim configuration using lazy.nvim
- AI-first development approach with multiple AI assistants
- Optimized for both speed and functionality
- Consistent theming across all tools
- Custom keymaps for improved productivity
- Automated installation process

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
