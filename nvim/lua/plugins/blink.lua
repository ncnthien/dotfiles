return {
  "saghen/blink.cmp",
  version = '*',
  dependencies = {
    "giuxtaposition/blink-cmp-copilot"
  },
  opts = {
    keymap = {
      preset = "default",
      ["<C-space>"] = {},
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "accept" }
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true
        }
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      ghost_text = {
        enabled = true,
        show_with_menu = true
      },
    },
    cmdline = {
      completion = {
        menu = {
          auto_show = true
        }
      },
      keymap = {
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
        ["<Tab>"] = { "accept" }
      }
    }
  },
  opts_extend = { "sources.default" }
}
