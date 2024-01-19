return {
  "tpope/vim-fugitive",
  name = "fugitive",
  keys = {
    { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add all" },
    { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
    { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git vertical diff" },
    { 
      "<leader>gcm", 
      function()
        vim.ui.input({ prompt = "Commit message: " }, function(input)
        vim.cmd('Git commit -m "'..input..'"')
        end)
      end, 
      desc = "Git commit message" 
    },
    { "<leader>gps", "<cmd>Git push<cr>", desc = "Git push" },
    { "<leader>gpl", "<cmd>Git pull<cr>", desc = "Git pull" }
  }
}
