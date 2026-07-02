# Dotfiles of ncnthien

A modern, AI-enhanced development environment for macOS, centered around Neovim,
Alacritty, tmux, and the AeroSpace tiling window manager. Everything is wired up
through a single `install.sh` that creates symlinks and installs the required
external plugins.

## Overview

### Editor — Neovim
Fully modular configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim).
Leader key is `<space>`; open Neovim with the `v` alias (not `nvim`).

- **AI assistance**
  - [sidekick.nvim](https://github.com/folke/sidekick.nvim) — Claude Code integration in Neovim (tmux-aware, floating window)
  - [copilot.lua](https://github.com/zbirenbaum/copilot.lua) — included but disabled by default (`enabled = false`)
- **Language tooling**
  - LSP via `nvim-lspconfig` + [Mason](https://github.com/williamboman/mason.nvim) (`lua_ls`, `vtsls`, `eslint`, `astro`, `tailwindcss`)
  - [blink.cmp](https://github.com/saghen/blink.cmp) completion engine
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`main` branch) for syntax highlighting & indentation
  - [conform.nvim](https://github.com/stevearc/conform.nvim) — format on save with Prettier (uses local `node_modules/.bin/prettier` when present)
  - [tsc.nvim](https://github.com/dmmulroy/tsc.nvim) — project-wide TypeScript type checking
- **Git**
  - [vim-fugitive](https://github.com/tpope/vim-fugitive) — Git operations
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) — inline hunk signs & actions
  - [diffview.nvim](https://github.com/sindrets/diffview.nvim) — rich diffs & file history
- **Navigation & search**
  - [snacks.nvim](https://github.com/folke/snacks.nvim) — picker & file explorer (fuzzy find, grep, code actions)
  - [flash.nvim](https://github.com/folke/flash.nvim) — jump-anywhere motions (`s`)
  - [grapple.nvim](https://github.com/cbochs/grapple.nvim) — pin & jump between key files
  - [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) — project-wide search & replace
- **Editing helpers**
  - [vim-surround](https://github.com/tpope/vim-surround)
  - [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
  - [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) — note-taking (vaults under `~/vaults/*`)
- **Database & HTTP**
  - [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) — database explorer (`<leader>db`)
  - [kulala.nvim](https://github.com/mistweaverco/kulala.nvim) — REST/HTTP client for `.http`/`.rest` files
- **Aesthetics**
  - [kanagawa-paper.nvim](https://github.com/thesimonho/kanagawa-paper.nvim) — active theme is `kanagawa-paper-ink`
  - Custom statusline (`lua/config/statusline.lua`)

### Terminal — Alacritty
- GPU-accelerated terminal, maximized on startup, buttonless decorations
- Kanagawa Dragon theme (`alacritty/kanagawa-dragon.toml`)
- JetBrainsMono Nerd Font
- Custom key bindings (e.g. Shift+Enter, Ctrl+.)

### Multiplexer — tmux
- Prefix remapped to `M-Space`, mouse on, zero escape time
- [tmux-kanagawa](https://github.com/Nybkox/tmux-kanagawa) (Dragon variant)
- Plugins managed by [TPM](https://github.com/tmux-plugins/tpm)

### Window management — AeroSpace
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) tiling window manager (`.aerospace.toml`)
- Alt-based focus/move/resize keybinds, `U/I/O/P` workspaces
- Integrates with [SketchyBar](https://github.com/FelixKratz/SketchyBar) and [JankyBorders](https://github.com/FelixKratz/JankyBorders) via startup hooks

### Shell — zsh
- [oh-my-zsh](https://ohmyz.sh/) with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
- Plugins: `git`, `zsh-autosuggestions`, `zsh-nvm` (external plugins auto-installed by `install.sh`)
- [fzf](https://github.com/junegunn/fzf) key bindings, [lsd](https://github.com/lsd-rs/lsd) for `ls`
- Aliases: `v` (nvim), `l` / `ls` (lsd), `dot` (~/dotfiles), `bin` (~/bin)

## Prerequisites
- [alacritty](https://alacritty.org/)
- [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- [node](https://nodejs.org/en/download) (for LSP servers & Prettier)
- [git](https://git-scm.com/downloads)
- [oh-my-zsh](https://ohmyz.sh/)
- [tmux](https://github.com/tmux/tmux/wiki/Installing)
- [fzf](https://github.com/junegunn/fzf), [lsd](https://github.com/lsd-rs/lsd)
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) (optional, for tiling WM)
- [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

## Installation
Clone the repo into `~/dotfiles`:
```bash
git clone git@github.com:ncnthien/dotfiles.git ~/dotfiles
```

Run the install script to create symlinks and install external plugins:
```bash
cd ~/dotfiles
chmod +x ./install.sh
bash ./install.sh
```

`install.sh` is idempotent (safe to re-run) and will:
- Create `~/.config` as a real directory and symlink `alacritty/` and `nvim/` into it
- Symlink `.zshrc`, `.tmux.conf`, and `.aerospace.toml` into `$HOME`
- Clone the external oh-my-zsh plugins (`zsh-autosuggestions`, `zsh-nvm`)
- Clone [TPM](https://github.com/tmux-plugins/tpm) for tmux

After installing:
- Reload your shell: `source ~/.zshrc`
- Open tmux and press `prefix + I` (`M-Space` then `I`) to install tmux plugins
- Open Neovim with `v` — lazy.nvim bootstraps and installs everything on first launch

## Troubleshooting

#### My nvim does not work anymore?
Use `v` instead of `nvim` — the alias is set in `.zshrc`.

#### Treesitter errors (`module 'nvim-treesitter.configs' not found` or `attempt to call method 'range'`)?
The config uses nvim-treesitter's `main` branch (required for Neovim 0.11+/0.12).
After changing branches run `:Lazy sync` (and `:Lazy clean` if needed) so lazy.nvim
checks out `main`, then `:TSUpdate` to rebuild the parsers.

#### Autosuggestions / nvm not loading in zsh?
`zsh-autosuggestions` and `zsh-nvm` are external oh-my-zsh plugins. Re-run
`bash ./install.sh` to clone them, then `source ~/.zshrc`.

Feel free to open an issue if you run into problems with this repo.
