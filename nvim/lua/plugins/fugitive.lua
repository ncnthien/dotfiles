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
    {
      "<leader>gd",
      function()
        vim.ui.input({ prompt = "Which branch do you want to diff with current branch?: " }, function(input)
          vim.cmd('Gvdiffsplit ' .. input)
        end)
      end,
      desc = "Git vertical diff"
    },
    { "<leader>gl",  "<cmd>Git pull<cr>",            desc = "Git pull" },
  }
}
