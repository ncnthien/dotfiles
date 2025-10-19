return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    -- User commands to enable/disable format on save
    vim.api.nvim_create_user_command("ConformDisableFormatOnSave", function()
      vim.g.conform_format_on_save_enabled = false
      print("Conform format-on-save disabled")
    end, { desc = "Disable Conform format on save" })

    vim.api.nvim_create_user_command("ConformEnableFormatOnSave", function()
      vim.g.conform_format_on_save_enabled = true
      print("Conform format-on-save enabled")
    end, { desc = "Enable Conform format on save" })
  end,
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      astro = { "prettier" },
    },
    format_on_save = function(bufnr)
      -- Disable with :ConformDisableFormatOnSave
      -- Enable with :ConformEnableFormatOnSave
      if vim.g.conform_format_on_save_enabled == false then
        return
      end
      return { timeout_ms = 100, lsp_fallback = true }
    end,
    formatters = {
      prettier = {
        -- Use local prettier from node_modules if available
        command = function(self, ctx)
          local util = require("conform.util")
          return util.find_executable({
            "node_modules/.bin/prettier",
          }, "prettier")(self, ctx)
        end,
      },
    },
  },
}
