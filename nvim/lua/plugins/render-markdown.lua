return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown", "codecompanion" },
  config = function()
    require("render-markdown").setup()
  end
}
