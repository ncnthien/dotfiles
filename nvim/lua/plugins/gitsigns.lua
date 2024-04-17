return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  keys = {
    { "<leader>gsp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Git hunk" },
    { "<leader>gsr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Git hunk" },
    { "]]", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
    { "[[", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
  },
  config = function ()
    require("gitsigns").setup()
  end
}
