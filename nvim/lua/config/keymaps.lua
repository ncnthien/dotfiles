local map = vim.keymap.set

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Disable arrow keys
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("i", "<Up>", "<Nop>")
map("i", "<Down>", "<Nop>")
map("i", "<Left>", "<Nop>")
map("i", "<Right>", "<Nop>")

-- Quit all
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Move to window
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>wj", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>wl", "<C-W>v", { desc = "Split window right" })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Center screen when moving
map("n", "<C-u>", "<C-u>zz", { desc = "Center when scroll up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Center when scroll down" })

-- Clear search with <esc>
map({ "i", "x", "n", "s" }, "<esc>", "<cmd>:silent! noh<cr><esc>", { desc = "Clear search" })
