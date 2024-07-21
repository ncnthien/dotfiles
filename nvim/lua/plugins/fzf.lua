return {
  "ibhagwan/fzf-lua",
  name = "fzf",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", { noremap = true, silent = true, description = "files" } },
    { "<leader>fl", "<cmd>FzfLua live_grep<cr>", { noremap = true, silent = true, description = "live_grep" } },
    { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { noremap = true, silent = true, description = "grep_cword" } },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions previewer=false<cr>", { noremap = true, silent = true, description = "code action" } },
    { "<leader>fc", "<cmd>FzfLua grep search=>>>>>>><cr>", { noremap = true, silent = true, description = "search conflict" } },
  },
  config = function()
    require("fzf-lua").setup({
      file_ignore_patterns = { ".git/", "node_modules/", "e2e/" },
      keymap = {
        builtin = {
          ["<C-u>"] = "preview-page-up",
          ["<C-d>"] = "preview-page-down",
        }
      },
      fzf_colors = true,
      winopts = {
        border = "single",
        fullscreen = true,
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
