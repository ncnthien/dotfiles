return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
    "echasnovski/mini.diff"
  },
  keys = {
    { "<leader>cc", ":CodeCompanionAction", desc = "Code Companion Action" },
  },
  config = function ()
    require("codecompanion").setup({
      prompt_library = {
        ["Generate a Commit Message"] = {
          prompts = {
            {
              role = "user",
              content = function()
                return string.format(
                  [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

```diff
%s
```

  The current branch is %s.
  The format of commit title should be "<current_branch>: <description>"
  For example: if the current branch is "feature/1234", the change is add "creating books"
    - The valid commit title should be "feature/1234: add books feature".
    - The invalid commit title should be "feature/1234: feat(book-feature): add new feature".
  The above commit title is invalid because it contains more than one colon.
  ]],
                  vim.fn.system("git diff --no-ext-diff --staged"),
                  vim.fn.FugitiveHead()
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        }
      },
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.7-sonnet"
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
          },
          slash_commands = {
            ["file"] = {
              opts = {
                provider = "snacks"
              }
            }
          },
          tools = {
            ["mcp"] = {
              callback = function() return require("mcphub.extensions.codecompanion") end,
              description = "Call tools and resources from the MCP Servers",
              opts = {
                requires_approval = true,
              }
            }
          }
        }
      },
      display = {
        chat = {
          -- show_header_separator = true, This option cause a bug that we cannot insert buffer into the chat
          window = {
            width = 70
          },
          message_formatter = "render-markdown" -- Use render-markdown.nvim for formatting messages
        },
        diff = {
          enabled = true,
          provider = "mini_diff"
        }
      }
    })
  end
}
