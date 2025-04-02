local map = vim.keymap.set

-- Select, delete, yank all
map("n", "vig", "gg<S-v>G", { desc = "Select entire buffer content" })
map("n", "dig", "ggdG", { desc = "Delete entire buffer content" })
map("n", "yig", "ggyG", { desc = "Yank (copy) entire buffer content" })
map("n", "=ig", "gg=G", { desc = "Auto-indent entire buffer content" })
map("n", "cig", "ggcG", { desc = "Change (delete and enter insert mode) entire buffer content" })

-- Disable arrow keys
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("i", "<Up>", "<Nop>")
map("i", "<Down>", "<Nop>")
map("i", "<Left>", "<Nop>")
map("i", "<Right>", "<Nop>")

-- Move to window
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Resize windows
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<A-j>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-k>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })

-- Windows
map("n", "<leader>ww", "<C-W>p", { desc = "Jump to previous window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Close current window" })
map("n", "<leader>wo", "<C-W>o", { desc = "Keep only current window" })
map("n", "<leader>wj", "<C-W>s", { desc = "Split window horizontally" })
map("n", "<leader>wl", "<C-W>v", { desc = "Split window vertically" })

-- Center screen when moving
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll half-page up and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll half-page down and center" })

-- Center screen when jumping
map("n", "<C-i>", "<C-i>zz", { desc = "Jump to newer position and center" })
map("n", "<C-o>", "<C-o>zz", { desc = "Jump to older position and center" })

-- Center screen when move to next/prev result
map("n", "*", "*Nzz", { desc = "Search word under cursor and center" })
map("n", "#", "#Nzz", { desc = "Search word under cursor backward and center" })
map("n", "n", "nzz", { desc = "Go to next search match and center" })
map("n", "N", "Nzz", { desc = "Go to previous search match and center" })

-- Clear search with <esc>
map({ "i", "x", "n", "s" }, "<esc>", "<cmd>:silent! noh<cr><esc>", { desc = "Escape and clear search highlights" })

-- Better up/down movement
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Navigate between quickfix list
map("n", "gn", "<cmd>cnext<cr>", { desc = "Next quickfix item" })
map("n", "gp", "<cmd>cprev<cr>", { desc = "Previous quickfix item" })

-- Map space to .* in search command mode
map("c", "<space>", function ()
  local mode = vim.fn.getcmdtype()
  if mode == "?" or mode == "/" then
    return ".*"
  else
    return " "
  end
end, { expr = true })

-- console.log current word (JS only)
map(
  "n",
  "cn",
  function()
    local current_word = vim.fn.expand("<cword>")
    local current_line = vim.api.nvim_get_current_line()
    local indent = string.match(current_line, "^%s*")
    vim.cmd('normal! o')
    local new_line_num = vim.fn.line('.')
    vim.fn.setline(new_line_num, indent .. 'console.log(\'' .. current_word .. '\', '.. current_word ..')')
    vim.cmd('normal! $')
  end,
    { noremap = true, silent = true, desc = "Insert console.log for current word" }
)
