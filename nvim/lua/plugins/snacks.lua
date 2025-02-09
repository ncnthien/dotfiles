local picker = {
  enabled = true,
  ui_select = false,
  layout = {
    fullscreen = true
  },
  win = {
    input = {
      keys = {
        ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
        ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
        ["<Esc>"] = { "close", mode = { "n", "i" } }
      }
    }
  },
}

local dashboard = {
  enabled = true,
  sections = {
    { section = "header" },
    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 }
  },
}

local exclue = { ".git/", "node_modules/", "e2e/" }

local words = {
  enabled = true,
  debounce = 10
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = picker,
    dashboard = dashboard,
    words = words
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files({ exclude = exclue }) end, desc = "Files" },
    { "<leader>fl", function() Snacks.picker.grep({ exclude = exclue }) end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word({ exclude = exclue }) end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fc", function() Snacks.picker.grep_word({
      search = function()
        return "<<<<<<<"
      end
    }) end, desc = "Search conflict" },
    { "<leader>fa", function() vim.lsp.buf.code_action() end, silent = true, desc = "Code action" },
    { "<leader>fe", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
  }
}
