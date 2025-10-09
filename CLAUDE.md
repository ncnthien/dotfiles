# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for a modern development environment centered around Neovim, with heavy AI integration and macOS-specific configurations.

## ⚠️ CRITICAL: Memory Management with ByteRover

**This is a MANDATORY workflow rule that MUST be followed for every task:**

**BEFORE starting ANY task:**
- ALWAYS use ByteRover MCP (`mcp__byterover-mcp__byterover-retrieve-knowledge`) to retrieve relevant context/memory
- Search for project conventions, file locations, configurations, previously discovered solutions, and any relevant patterns

**AFTER completing ANY task:**
- MUST evaluate if new reusable context was discovered (conventions, key file locations, configurations, keymaps, setup steps, solutions, patterns)
- If valuable for future sessions, MUST ask permission before storing to ByteRover
- Use `mcp__byterover-mcp__byterover-store-knowledge` after getting approval
- Example: "I've learned that [X]. Would you like me to store this in memory for future reference?"

**This ensures continuity across sessions and prevents rediscovering the same information repeatedly.**

## Installation & Setup

**Initial Setup:**
```bash
# Clone and install
git clone git@github.com:ncnthien/dotfiles.git ~/
cd ~/dotfiles
chmod +x ./install.sh
bash ./install.sh
```

The installation script creates symbolic links from `~/dotfiles` to the appropriate config locations:
- `alacritty/` → `~/.config/alacritty/`
- `.tmux.conf` → `~/.tmux.conf`
- `.zshrc` → `~/.zshrc`
- `nvim/` → `~/.config/nvim/`

**Neovim Setup:**
- Use `v` alias (not `nvim`) to open Neovim - this is configured in `.zshrc`

## Git Commit Convention

**Critical:** This repository follows a strict commit message format:
```
<branch_name>: <commit_message>

<detail_description>
```

Examples from commit history:
- `main: add memory usage policy`
- `main: update lazy-lock.json`
- `main: remove smear-cursor and vectorcode plugins`

**Rules:**
- Commit title MUST start with current branch name followed by colon
- TWO blank lines separate title from detail description
- Detail description items start with `-` prefix

## Neovim Architecture

### Core Structure

The Neovim configuration uses **lazy.nvim** for plugin management with a modular structure:

```
nvim/
├── init.lua                 # Bootstraps lazy.nvim, sets leader key to space
├── lazy-lock.json          # Lock file for plugin versions
└── lua/
    ├── config/
    │   ├── options.lua     # Editor options (2-space tabs, relative numbers, etc.)
    │   ├── keymaps.lua     # Global keybindings
    │   ├── autocmds.lua    # Auto-commands (LSP setup, auto-format, etc.)
    │   ├── statusline.lua  # Custom statusline configuration
    │   └── usercmds.lua    # User-defined commands
    └── plugins/            # Each file is a lazy.nvim plugin spec
```

### AI Integration

**Sidekick.nvim** (nvim/lua/plugins/sidekick.lua):
- Claude Code integration in Neovim
- tmux multiplexer support enabled
- Key bindings:
  - `<leader>aa`: Toggle Sidekick CLI
  - `<leader>as`: Select CLI tool
  - `<leader>at`: Send current context
  - `<leader>av`: Send visual selection
  - `<leader>ap`: Select prompt
  - `<C-.>`: Switch focus
  - `<Tab>`: Jump to next edit suggestion or apply

### LSP Configuration

LSP setup is in `nvim/lua/plugins/lsp.lua`:
- Uses Mason for LSP server management
- Installed servers: `lua_ls`, `vtsls`, `eslint`, `astro`, `tailwindcss`, `rust_analyzer`
- Blink.cmp for completions
- Auto-fix with ESLint on save (can disable with `vim.g.eslint_auto_fix_enabled = false`)

**LSP Keybindings** (set in nvim/lua/config/autocmds.lua:29-71):
- `<leader>cx`: Hover documentation
- `<leader>cr`: Rename
- `<leader>cf`: Format
- `K`: Go to definition
- `<leader>cq`: Quick fix (preferred action)
- `<leader>cs`: Show diagnostics
- `tn/tp`: Next/previous diagnostic (centered)

### Key Custom Keymaps

Notable keybindings from `nvim/lua/config/keymaps.lua`:

**Text Object Extensions:**
- `vig/dig/yig/=ig/cig`: Select/delete/yank/indent/change entire buffer

**Window Management:**
- `<C-h/j/k/l>`: Navigate windows
- `<A-h/j/k/l>`: Resize windows
- `<leader>w` prefix: Window operations

**Navigation:**
- `<C-u/d>`: Scroll half-page (centered)
- `<C-i/o>`: Jump forward/backward (centered)
- `*/# /n/N`: Search (centered)
- `gn/gp`: Next/prev quickfix item

**JavaScript Helper:**
- `cn`: Insert `console.log('<word>', <word>)` for word under cursor

**File/Search Operations** (via Snacks picker):
- `<leader>ff`: Find files (excludes .git/, node_modules/, e2e/)
- `<leader>fl`: Grep
- `<leader>fw`: Grep word/selection
- `<leader>fc`: Search git conflicts (`<<<<<<<`)
- `<leader>fa`: Code action
- `<leader>fe`: LSP references
- `<leader>e`: File explorer

### Important Autocmds

From `nvim/lua/config/autocmds.lua`:
- Auto-restore cursor position on buffer read (except gitcommit)
- Auto ESLint fix on save (when `:LspEslintFixAll` available)
- Highlight yanked text briefly
- Auto-resize windows on VimResized

## Shell Configuration

**ZSH Aliases** (from `.zshrc`):
- `v`: Neovim (DO NOT use `nvim`)
- `l`: `lsd -lha` (detailed list)
- `ls`: `lsd` (modern ls)
- `dot`: `cd ~/dotfiles`
- `bin`: `cd ~/bin`

**Theme:** Powerlevel10k with custom config in `.p10k.zsh`

**Plugins:** git, zsh-autosuggestions, zsh-nvm

## Color Scheme & Theming

- Primary theme: Kanagawa (with kanagawa-paper variant available)
- Nightfox as alternative
- Consistent theming across Neovim, Alacritty, and other tools
- Cursor: Block in all modes (n-v-c-i)
