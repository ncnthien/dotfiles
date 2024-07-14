return {
  "ibhagwan/fzf-lua",
  name = "fzf",
  keys = {
    { "<leader>ff", ":FzfLua files<cr>", { noremap = true, silent = true, description = "files" } },
    { "<leader>fl", ":FzfLua live_grep<cr>", { noremap = true, silent = true, description = "live_grep" } },
    { "<leader>fw", ":FzfLua grep_cword<cr>", { noremap = true, silent = true, description = "grep_cword" } },
    { "<leader>ca", ":FzfLua lsp_code_actions previewer=false<cr>", { noremap = true, silent = true, description = "code action" } }
  },
  config = function()
    require("fzf-lua").setup({
      keymap = {
        builtin = {
          ["<C-u>"] = "preview-page-up",
          ["<C-d>"] = "preview-page-down",
        }
      },
      fzf_colors = true,
      winopts = {
        border = "single",
        preview = {
          title = false,
          scrollbar = false,
          winopts = {
            number = false
          }
        }
      },
      files = {
        cwd_prompt = false,
        formatter = "path.filename_first",
      },
      grep = {
        formatter = "path.filename_first",
      }
    })
  end
}
