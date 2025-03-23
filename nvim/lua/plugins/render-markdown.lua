return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown", "avante" },
  config = function()
    require("render-markdown").setup()
  end
}
