return {
  "tpope/vim-fugitive",
  name = "fugitive",
  event = "VimEnter",
  keys = {
    { "<leader>gg", "<cmd>vertical Git<cr><cmd>vertical resize 70<cr>", desc = "Git status" },
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add all" },
    { "<leader>glg", "<cmd>Git log<cr>", desc = "Git log" },
    { "<leader>gb", "<cmd>Git branch<cr>", desc = "Git branch" },
    { "<leader>gd", ":Gvdiffsplit!", desc = "Git vertical diff" },
  }
}
