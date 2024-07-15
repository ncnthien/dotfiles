return {
  "tpope/vim-fugitive",
  name = "fugitive",
  event = "VimEnter",
  keys = {
    { "<leader>gg",  "<cmd>Git<cr>",                desc = "Git status" },
    { "<leader>ga",  "<cmd>Git add .<cr>",          desc = "Git add all" },
    { "<leader>glg", "<cmd>Git log<cr>",            desc = "Git log" },
    { "<leader>gb",  "<cmd>Git branch<cr>",         desc = "Git branch" },
    { "<leader>gc",  "<cmd>Git commit<cr>",         desc = "Git commit" },
    { "<leader>gp",  "<cmd>Git push<cr>",           desc = "Git push" },
    { "<leader>gd",  ":Gvdiffsplit!",               desc = "Git vertical diff" },
    { "<leader>gl",  "<cmd>Git pull<cr>",           desc = "Git pull" },
  }
}
