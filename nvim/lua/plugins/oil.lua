return {
  'stevearc/oil.nvim',
  keys = {
    { '<leader>o', '<cmd>Oil<CR>', { desc = 'Open Oil' } },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    delete_to_trash = true,
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
      is_hidden_file = function(name)
        return vim.startswith(name, '.') or vim.endswith(name, 'node_modules')
      end,
    },
    columns = {
      "icon",
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["-"] = {
        callback = function()
          require('oil').select({ vertical = true, split = "botright" })
        end,
        desc = "Select split vertical right",
        mode = "n"
      },
      ["<S-CR>"] = "actions.parent",
      ["qq"] = "actions.close",
      ["<C-p>"] = "actions.preview",
      ["<C-r>"] = "actions.refresh",
      ["g."] = "actions.toggle_hidden"
    }
  }
}
