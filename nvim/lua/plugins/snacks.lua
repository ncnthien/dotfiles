return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
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
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files({ exclude = { ".git/", "node_modules/", "e2e/" } }) end, desc = "Files" },
    { "<leader>fl", function() Snacks.picker.grep({ exclude = { ".git/", "node_modules/", "e2e/" } }) end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word({ exclude = { ".git/", "node_modules/", "e2e/" } }) end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fc", function() Snacks.picker.grep_word({
      search = function()
        return "<<<<<<<"
      end
    }) end, desc = "Search conflict" },
    { "<leader>fa", function() vim.lsp.buf.code_action() end, { noremap = true, silent = true, description = "code action" } },
    { "<leader>fe", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
  },
}
