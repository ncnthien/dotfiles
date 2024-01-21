return {
  "tpope/vim-fugitive",
  name = "fugitive",
  keys = {
    { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add all" },
    { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
    { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git vertical diff" },
    { "<leader>gb", "<cmd>Git branch<cr>", desc = "Git branch" },
    { 
      "<leader>gc", 
      function()
        vim.ui.input({ prompt = "Commit message: " }, function(input)
          if not input or input == '' then
            vim.cmd('Git commit')
          else
            vim.cmd('Git commit -m "'..input..'"')
          end
        end)
      end, 
      desc = "Git commit" 
    },
    { "<leader>gps", "<cmd>Git push<cr>", desc = "Git push" },
    { "<leader>gpl", "<cmd>Git pull<cr>", desc = "Git pull" },
  }
}
