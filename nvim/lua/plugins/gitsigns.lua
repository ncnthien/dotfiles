return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  keys = {
    { "to", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Git hunk" },
    { "td", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Git hunk" },
    { "tj", "<cmd>Gitsigns next_hunk<cr>zz", desc = "Next hunk" },
    { "tk", "<cmd>Gitsigns prev_hunk<cr>zz", desc = "Previous hunk" },
  },
  config = function ()
    require("gitsigns").setup()
  end
}
