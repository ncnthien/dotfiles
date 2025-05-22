return {
  "sindrets/diffview.nvim",
  name = "diffview",
  keys = {
    { "<leader>df", ":DiffviewFileHistory %", desc = "Diffview current file history" },
    { "<leader>dd", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
    { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" }
  },
  opts = { use_icons = false }
}
