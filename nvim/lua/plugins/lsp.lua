return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp"
  },
  config = function()
    -- LSP
    require("mason").setup({ ui = { border = "single" } })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "eslint",
        "astro",
        "tailwindcss"
      },
      handlers = {
        function(server_name)
          local lspconfig = require("lspconfig")
          local capabilities = require("blink.cmp").get_lsp_capabilities()

          lspconfig[server_name].setup({
            capabilities = capabilities,
            handlers = {
              ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
              ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
            },
          })

          lspconfig.vtsls.setup({
            capabilities = capabilities,
            settings = {
              typescript = {
                preferences = {
                  importModuleSpecifier = "non-relative"
                }
              }
            },
            handlers = {
              ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
              ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
            },
          })

          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            }
          })


          lspconfig.rust_analyzer.setup({
            settings = {
              ["rust-analyzer"] = {
                diagnostics = {
                  enable = true,
                }
              }
            }
          })

        end,
      }
    })

    vim.opt.pumheight = 7
    vim.diagnostic.config({ float = { border = "single" } })
  end
}
