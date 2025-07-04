return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    -- "giuxtaposition/blink-cmp-copilot",
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    { "kristijanhusak/vim-dadbod-ui", ft = { "sql", "mysql", "plsql" }, lazy = true }
  },
  opts = {
    keymap = {
      preset = "default",
      ["<C-space>"] = {},
      ["<Tab>"] = { "accept" }
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        sql = { "snippets", "dadbod", "buffer" }
      },
      providers = {
        -- copilot = {
        --   name = "copilot",
        --   module = "blink-cmp-copilot",
        --   score_offset = 100,
        --   async = true
        -- },
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink"
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      list = {
        selection = {
          auto_insert = false
        }
      },
      ghost_text = {
        enabled = true,
        show_with_menu = true
      },
      accept = {
        auto_brackets = {
          enabled = false,
        }
      }
    },
    cmdline = {
      completion = {
        list = {
          selection = {
            auto_insert = false
          }
        },
        menu = {
          auto_show = true
        }
      },
      keymap = {
        ["<Tab>"] = { "accept" }
      }
    }
  },
  opts_extend = { "sources.default" }
}
