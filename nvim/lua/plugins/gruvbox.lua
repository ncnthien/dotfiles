-- Gruvbox light palette
local palette = {
  bg = "#fbf1c7",     -- background
  bg0 = "#d5c4a1",    -- light background
  red = "#cc241d",    -- errors
  yellow = "#d65d0e", -- warnings
  green = "#98971a",  -- hints
  blue = "#458588",   -- info
}

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  dependencies = {
    "folke/snacks.nvim"
  },
  config = function ()
    -- Trick to load Snacks.picker before gruvbox by requiring and open it here!
    local snacks = require("snacks")
    local picker = snacks.picker.files()
    picker:close()

    require("gruvbox").setup({
      overrides = {
        SignColumn = { bg = "NONE" },
        CursorLineNr = { bg = "NONE" },
        DiagnosticSignError = { bg = "NONE", fg = palette.red },
        DiagnosticSignWarn = { bg = "NONE", fg = palette.yellow },
        DiagnosticSignInfo = { bg = "NONE", fg = palette.blue },
        DiagnosticSignHint = { bg = "NONE", fg = palette.green },
        -- Snacks picker
        SnacksPickerListBorder = { bg = "NONE" },
        SnacksPickerInputBorder = { bg = "NONE" },
        SnacksPickerPreviewBorder = { bg = "NONE" },
        SnacksPickerPreviewTitle = { bg = "NONE", fg = palette.green },
        SnacksPickerBoxBorder = { bg = "NONE" },
        SnacksPickerTitle = { bg = "NONE", fg = palette.green },
        SnacksPickerToggleHidden = { fg = "NONE", bg = palette.bg0 },
        SnacksPickerToggleIgnored = { fg = "NONE", bg = palette.bg0 },
        SnacksNormal = { bg = "NONE" },
        SnacksPicker = { bg = "NONE" },
        -- Flash
        FlashLabel = { bg = palette.green, fg = palette.bg }
      }
    })
    vim.o.background = "light"
    vim.cmd([[colorscheme gruvbox]])
  end,
}
