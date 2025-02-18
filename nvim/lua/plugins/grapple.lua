return {
  "cbochs/grapple.nvim",
  dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
  opts = { scope = "git", },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "<leader>m", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tag tags window" },
    { "ma", "<cmd>Grapple tag index=1<cr>", desc = "Grapple tag with index=1" },
    { "ms", "<cmd>Grapple tag index=2<cr>", desc = "Grapple tag with index=2" },
    { "md", "<cmd>Grapple tag index=3<cr>", desc = "Grapple tag with index=3" },
    { "mf", "<cmd>Grapple tag index=4<cr>", desc = "Grapple tag with index=4" },
    { "'a", "<cmd>Grapple select index=1<cr>", desc = "Grapple select index=1" },
    { "'s", "<cmd>Grapple select index=2<cr>", desc = "Grapple select index=2" },
    { "'d", "<cmd>Grapple select index=3<cr>", desc = "Grapple select index=3" },
    { "'f", "<cmd>Grapple select index=4<cr>", desc = "Grapple select index=4" },
  },
}
