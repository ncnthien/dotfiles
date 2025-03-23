return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    file_selector = {
      provider = "snacks"
    },
    provider = "copilot",
    copilot = {
      model = "claude-3.7-sonnet",
      temperature = 0,
      -- disable_tools = true
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
    system_prompt = function ()
      local hub = require("mcphub").get_hub_instance()
      return hub:get_active_servers_prompt()
    end,
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
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
