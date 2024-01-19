return {
  "tpope/vim-fugitive",
  name = "fugitive",
  keys = {
    { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add all" },
    { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
    { "<leader>gd", "<cmd>Gvdiff<cr>", desc = "Git vertical diff" },
    { 
      "<leader>gcm", 
      function()
        vim.ui.input({ prompt = "Commit message: " }, function(input)
          vim.cmd([[ Git commit -m %s ]], input)
        end)
      end, 
      desc = "Git commit message" 
    }
  }
}
