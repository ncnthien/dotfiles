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
    { "<leader>fc", "<cmd>FzfLua grep search=<<<<<<<<cr>", { noremap = true, silent = true, description = "search conflict" } },
    { "<leader>fv", "<cmd>FzfLua grep_visual<cr>", { noremap = true, silent = true, description = "search visual selection" } },
    { "<leader>fa", "<cmd>FzfLua lsp_code_actions previewer=false<cr>", { noremap = true, silent = true, description = "code action" } },
    { "<leader>fe", "<cmd>FzfLua lsp_references<cr>", { noremap = true, silent = true, description = "references" } },
    { "<leader>fD", "<cmd>FzfLua lsp_declarations jump_to_single_result=true<cr>", { noremap = true, silent = true, description = "declarations" } },
  },
  opts = {
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
        },
        vertical = "down:65%",
        flip_columns = 126,
      }
    },
    files = { cwd_prompt = false }
  },
}
