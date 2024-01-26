return {
  'stevearc/oil.nvim',
  keys = {
    { '<leader>oo', '<cmd>Oil<CR>', { desc = 'Open Oil' } },
    { '<leader>of', '<cmd>Oil --float<CR>', { desc = 'Open Oil with float' } },
  },
  opts = {
    delete_to_trash = true,
    use_default_keymaps = false,
    view_options = {
      is_hidden_file = function(name)
        return vim.startswith(name, '.') or vim.endswith(name, 'node_modules')
      end,
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["-"] = "actions.select",
      ["<C-m>"] = "actions.select_vsplit",
      ["_"] = "actions.parent",
      ["qq"] = "actions.close",
      ["<C-p>"] = "actions.preview",
      ["<C-r>"] = "actions.refresh",
      ["g."] = "actions.toggle_hidden"
    }
  }
}
