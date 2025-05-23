local picker = {
  enabled = true,
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

local exclude = { ".git/", "node_modules/", "e2e/" }

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
    words = words,
    scope = scope
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files({ exclude = exclude }) end, desc = "Files" },
    { "<leader>fl", function() Snacks.picker.grep({ exclude = exclude }) end, desc = "Grep" },
    { "<leader>fw", function() Snacks.picker.grep_word({ exclude = exclude }) end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fc", function() Snacks.picker.grep_word({
      on_close = function()
        vim.schedule(function()
          vim.cmd("Gvdiffsplit!")
        end)
      end,
      search = function()
        return "<<<<<<<"
      end
    }) end, desc = "Search conflict" },
    { "<leader>fa", function() vim.lsp.buf.code_action() end, silent = true, desc = "Code action" },
    { "<leader>fe", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" }
  }
}
