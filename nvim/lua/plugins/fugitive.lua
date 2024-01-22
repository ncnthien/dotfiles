return {
  "tpope/vim-fugitive",
  name = "fugitive",
  keys = {
    { "<leader>gg",  "<cmd>Git<cr>",                desc = "Git status" },
    { "<leader>ga",  "<cmd>Git add .<cr>",          desc = "Git add all" },
    { "<leader>glg", "<cmd>Git log<cr>",            desc = "Git log" },
    { "<leader>gd",  "<cmd>Gvdiffsplit<cr>",        desc = "Git vertical diff" },
    { "<leader>gb",  "<cmd>Git branch<cr>",         desc = "Git branch" },
    { "<leader>gc",  "<cmd>Git commit<cr>",         desc = "Git commit" },
    { "<leader>gca", "<cmd>Git commit --amend<cr>", desc = "Git commit amend" },
    { "<leader>gp",  "<cmd>Git push<cr>",           desc = "Git push" },
    {
      "<leader>gpf",
      function()
        vim.ui.input({ prompt = "Do you really want to force push? (y/n): " }, function(input)
          if input == 'y' then
            vim.cmd('Git push -f')
          else
            print('Force push cancelled.')
          end
        end)
      end,
      desc = "Git push force"
    },
    { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
  }
}
