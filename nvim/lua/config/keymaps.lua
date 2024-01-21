local map = vim.keymap.set

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Escape to normal mode
map("i", "jk", "<Esc>", { desc = "Escape to normal mode" })
map("v", "jk", "<Esc>", { desc = "Escape to normal mode" })

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
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>wj", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>wl", "<C-W>v", { desc = "Split window right", remap = true })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Select a word
map("n", "vv", "viw", { desc = "Select current word" })

