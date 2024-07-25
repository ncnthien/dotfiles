return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline"
      },
    })
  end,
}
