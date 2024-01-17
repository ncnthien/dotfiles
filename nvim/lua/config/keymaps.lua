local map = vim.keymap.set

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Escape to normal mode
map("i", "jk", "<Esc>")
map("v", "jk", "<Esc>")

-- Disable arrow keys
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("i", "<Up>", "<Nop>")
map("i", "<Down>", "<Nop>")
map("i", "<Left>", "<Nop>")
map("i", "<Right>", "<Nop>")

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
