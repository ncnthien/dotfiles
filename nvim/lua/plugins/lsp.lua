return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "zbirenbaum/copilot-cmp",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- LSP
    require("mason").setup({ ui = { border = "single" } })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "eslint",
        "rust_analyzer"
      },
      handlers = {
        function(server_name)
          local lspconfig = require("lspconfig")
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          lspconfig[server_name].setup({
            capabilities = capabilities,
            handlers = {
              ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
              ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
            },
          })
        end,
      }
    })
    require('lspconfig').lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    -- cmp
    local cmp = require('cmp')
    local mapping_insert = {
      ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 1 }), { 'i', 'c' }),
      ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 1 }), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }), { 'i', 'c' })
    }
    require('copilot_cmp').setup()
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert(mapping_insert),
      sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
          { name = 'buffer' },
        }),
      experimental = {
        ghost_text = true
      },
      performance = {
        debounce = 0,
        throttle = 0
      }
    })
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(mapping_insert),
      sources = {
        { name = 'buffer' }
      }
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(mapping_insert),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
          { name = 'cmdline' }
        })
    })

    vim.opt.pumheight = 7
    vim.diagnostic.config({ float = { border = "single" } })
  end
}
