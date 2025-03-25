return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
    "echasnovski/mini.diff",
    "banjo/contextfiles.nvim"
  },
  keys = {
    { "<leader>cc", ":CodeCompanionAction", desc = "Code Companion Action" },
  },
  config = function ()
    require("codecompanion").setup({
      prompt_library = {
        ["Lazy commit"] = {
          strategy = "chat",
          description = "Read the changes and commit",
          opts = {
            index = 10,
            is_default = true,
            is_slash_cmd = true,
            short_name = "lazycommit",
            auto_submit = false,
            stop_context_insertion = false
          },
          prompts = {
            {
              role = "user",
              content = function()
                return string.format(
                  [[
@cmd_runner You are a senior developer. Follow these steps to commit the current changes:
- Run command `git branch` to check the current branch.
- Run command `git status` to check the current status of the repository.
- Run command `git add .` to stage all changes.
- Run command `git diff --no-ext-diff --staged` to see the changes that will be committed.
- Run command `git commit -m "<current_branch>: <commit_message>"` to commit the changes.
NOTE: Make sure to following the following rules
- The commit convention MUST be: <current_branch>: <commit_message>
                  ]]
                )
              end,
              opts = {
                contains_code = true
              }
            }
          }
        },
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
          show_header_separator = true,
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
