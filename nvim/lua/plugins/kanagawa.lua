return {
  enabled = false,
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
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
      overrides = function(colors)
        return {
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          FloatTitle = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          CursorLineNr = { bg = "NONE" },
          LineNr = { bg = "NONE" },
          GitSignsAdd = { bg = "NONE" },
          GitSignsChange = { bg = "NONE" },
          GitSignsDelete = { bg = "NONE" },
          DiagnosticSignError = { bg = "NONE", fg = colors.samuraiRed },
          DiagnosticSignWarn = { bg = "NONE", fg = colors.roninYellow },
          DiagnosticSignInfo = { bg = "NONE", fg = colors.waveAqua1 },
          DiagnosticSignHint = { bg = "NONE", fg = colors.dragonBlue },
          BlinkCmpMenu = { bg = "#16161D" },
          BlinkCmpMenuBorder = { bg = "#16161D" },
        }
      end,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus"
      },
    })

    vim.cmd("set background=dark")
    vim.cmd("colorscheme kanagawa")
  end
}
