return {
  "EdenEast/nightfox.nvim",
  enabled = false,
  name = "nightfox",
  lazy = "false",
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = true,
      }
    })
    vim.cmd([[colorscheme duskfox]])
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  end
}
