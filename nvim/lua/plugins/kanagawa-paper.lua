return {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function ()
    require("kanagawa-paper").setup({
      overrides = function()
        return {
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          FloatTitle = { bg = "NONE" },
        }
      end,
    })
    vim.cmd.colorscheme("kanagawa-paper-ink")
  end
}
