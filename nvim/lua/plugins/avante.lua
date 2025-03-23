return {
  enabled = false,
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    file_selector = {
      provider = "snacks"
    },
    provider = "copilot",
    copilot = {
      model = "claude-3.5-sonnet",
      temperature = 0,
    },
    behaviour = {
      auto_apply_diff_after_generation = true
    },
    windows = {
      position = "left",
      ask = {
        start_insert = false
      }
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    "folke/snacks.nvim",
    "ravitemer/mcphub.nvim",
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = { file_types = { "markdown", "Avante" }, },
      ft = { "markdown", "Avante" },
    },
  },
}
