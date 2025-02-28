local picker = {
  enabled = true,
  ui_select = false,
  layout = {
    fullscreen = true
  },
  sources = {
    explorer = {
      enabled = true,
      layout = { preset = "sidebar", fullscreen = false },
      replace_netrw = true,
      hidden = true,
      ignored = true,
      auto_close = true
    }
  },
  win = {
    input = {
      keys = {
        ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
        ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
        ["<Esc>"] = { "close", mode = { "n", "i" } },
        ["<c-h>"] = { { "toggle_hidden", "toggle_ignored" }, mode = { "i", "n" } }
      }
    }
  },
  formatters = {
    file = {
      -- filename_first = true,
      truncate = 100
    },
  }
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

local scope = {
  enabled = true
}

return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  priority = 1000,
  lazy = false,
  opts = {
    picker = picker,
    dashboard = dashboard,
    words = words,
    scope = scope
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files({ exclude = exclue }) end, desc = "Files" },
    { "<leader>fl", function() Snacks.picker.grep({ exclude = exclue }) end, desc = "Grep" },
    { "<leader>fw", function() Snacks.picker.grep_word({ exclude = exclue }) end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fc", function() Snacks.picker.grep_word({
      search = function()
        return "<<<<<<<"
      end
    }) end, desc = "Search conflict" },
    { "<leader>fa", function() vim.lsp.buf.code_action() end, silent = true, desc = "Code action" },
    { "<leader>fe", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" }
  }
}
