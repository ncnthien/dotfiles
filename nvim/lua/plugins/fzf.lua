return {
  "ibhagwan/fzf-lua",
  name = "fzf",
  keys = {
    { "<leader>ff", ":FzfLua files<CR>", { noremap = true, silent = true, description = "files" } },
    { "<leader>fl", ":FzfLua live_grep<CR>", { noremap = true, silent = true, description = "live_grep" } },
    { "<leader>fw", ":FzfLua grep_cword<CR>", { noremap = true, silent = true, description = "grep_cword" } },
    { "<leader>ca", ":FzfLua lsp_code_actions<CR>", { noremap = true, silent = true, description = "code action" } }
  },
  config = function()
    require("fzf-lua").setup({
      winopts = {
        on_create = function()
          vim.keymap.set("t", "<M-j>", "<Down>", { silent = true })
          vim.keymap.set("t", "<M-k>", "<Up>", { silent = true })
        end,
      },
      keymap = {
        builtin = {
          ["<M-u>"] = "preview-page-up",
          ["<M-d>"] = "preview-page-down",
        }
      }
    })
  end
}
