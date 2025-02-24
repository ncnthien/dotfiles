return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true,
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.5-sonnet"
            }
          }
        })
      end
    },
    strategies = {
      chat = {
        roles = {
          llm = function (adapter)
            return adapter.formatted_name
          end
        }
      }
    },
    display = {
      chat = {
        -- show_header_separator = true, This option cause a bug that we cannot insert buffer into the chat
        window = {
          width = 70
        }
      }
    }
  },
}
