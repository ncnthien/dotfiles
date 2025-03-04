return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    -- Default options:
    require('kanagawa').setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true},
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors)
        return {
          SignColumn = { bg = "NONE" },
          CursorLineNr = { bg = "NONE" },
          LineNr = { bg = "NONE" },
          DiagnosticSignError = { bg = "NONE", fg = colors.samuraiRed },
          DiagnosticSignWarn = { bg = "NONE", fg = colors.roninYellow },
          DiagnosticSignInfo = { bg = "NONE", fg = colors.waveAqua1 },
          DiagnosticSignHint = { bg = "NONE", fg = colors.dragonBlue },
        }
      end,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus"
      },
    })

    -- setup must be called before loading
    vim.cmd("set background=dark")
    vim.cmd("colorscheme kanagawa")
  end
}
