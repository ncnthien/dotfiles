local map = vim.keymap.set

-- Select, delete, yank all
map("n", "vig", "gg<S-v>G", { desc = "Select all" })
map("n", "dig", "ggdG", { desc = "Delete all" })
map("n", "yig", "ggyG", { desc = "Yank all" })

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

-- Resize windows
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<A-j>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-k>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })

-- Windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Close window" })
map("n", "<leader>wo", "<C-W>o", { desc = "Close all other windows" })
map("n", "<leader>wj", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>wl", "<C-W>v", { desc = "Split window right" })

-- Center screen when moving
map("n", "<C-u>", "<C-u>zz", { desc = "Center when scroll up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Center when scroll down" })

-- Center screen when jumping
map("n", "<C-i>", "<C-i>zz", { desc = "Center when jump forward" })
map("n", "<C-o>", "<C-o>zz", { desc = "Center when jump backward" })

-- Clear search with <esc>
map({ "i", "x", "n", "s" }, "<esc>", "<cmd>:silent! noh<cr><esc>", { desc = "Clear search" })

-- better up/down movement
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

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
  { noremap = true, silent = true, desc = "Log current word" }
)

-- add charracter surround
local opposite_char = {
  ["("] = ")",
  ["["] = "]",
  ["{"] = "}",
  ["<"] = ">"
}

map(
  { "n", "v" },
  "gs",
  function()
    local char = vim.fn.getcharstr()
    local opposite = opposite_char[char] or char
    local register_name = 's'
    local current_mode = vim.fn.mode()
    local is_visual_mode = current_mode == 'v' or current_mode == 'V' or current_mode == '\22'

    vim.cmd('normal! "' .. register_name .. 'd' .. (is_visual_mode and '' or 'iw'))
    vim.cmd('normal! i' .. char .. vim.fn.getreg(register_name) .. opposite)
  end,
  { noremap = true, silent = true, desc = "Add surround" }
)

