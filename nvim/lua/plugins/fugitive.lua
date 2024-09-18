return {
  "tpope/vim-fugitive",
  name = "fugitive",
  event = "VimEnter",
  keys = {
    { "<leader>g", "<cmd>vertical Git<cr><cmd>vertical resize 70<cr><cmd>setlocal nowrap<cr>", desc = "Git status" },
  }
}
