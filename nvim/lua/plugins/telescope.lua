return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  name = "telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VimEnter",
  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
    { "<leader>/",       "<cmd>Telescope live_grep<cr>",   desc = "Live grep",   mode = "n", },
    { "<leader>/",       "<cmd>Telescope grep_string<cr>", desc = "String grep", mode = "v", },
    { "<leader>y",       "<cmd>Telescope neoclip<cr>",     desc = "Clipboard" },
  },
  config = function()
    require("telescope").load_extension("neoclip")
  end,
}
