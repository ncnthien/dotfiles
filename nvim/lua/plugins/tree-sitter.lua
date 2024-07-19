return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
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
