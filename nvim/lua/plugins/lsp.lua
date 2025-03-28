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
    vim.opt.winborder = "single"
  end
}
