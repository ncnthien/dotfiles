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
                vim.g.codecompanion_auto_tool_mode = true
                return string.format(
                  [[
@cmd_runner You are a senior developer best at writing commit message. Giving you the current branch and the diff changes below:
- The diff:
```
%s
```
- The current branch: `%s`

Review view the changes and commit the changes with the following steps:
- Run command `git add .` to stage all changes.
- Run command `echo "<current_branch>: <commit_message>\n\n<detail_description>" > /tmp/commit_msg.txt && git commit -F /tmp/commit_msg.txt && rm /tmp/commit_msg.txt` to commit the changes.

NOTE: Make sure to following the following rules:
- The commit title convention MUST be: <current_branch>: <commit_message>
- Lines of detail description should be separated by ONE blank line (`\n`) for each item.
- An item of detail description must start with `-` prefix.
- The commit title and the the detail description should be separated by TWO blank lines (`\n\n`).
                  ]],
                  vim.fn.system("git diff --no-ext-diff"),
                  vim.fn.FugitiveHead()
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
