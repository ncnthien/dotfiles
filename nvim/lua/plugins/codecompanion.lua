return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
    "banjo/contextfiles.nvim",
    "Davidyz/VectorCode"
  },
  keys = {
    { "<leader>cc", ":CodeCompanionAction", desc = "Code Companion Action" },
  },
  config = function()
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
            auto_submit = true,
            stop_context_insertion = false
          },
          prompts = {
            {
              role = "user",
              content = function()
                vim.fn.system("git add .")
                vim.g.codecompanion_auto_tool_mode = true
                return string.format(
                  [[
@cmd_runner You are a senior developer best at writing commit message. Giving you the current branch and the diff changes below:
- The diff:
```
%s
```
- The current branch: `%s`

Review the changes and commit the changes with the following steps:
- Run command `git add .` to stage all changes.
- Run command `echo "<current_branch>: <commit_message>\n\n<detail_description>" > /tmp/commit_msg.txt && git commit -F /tmp/commit_msg.txt && rm /tmp/commit_msg.txt` to commit the changes.

NOTE: Make sure to following the following rules:
- The commit title convention MUST be: <current_branch>: <commit_message>
- The commit title and the the detail description should be separated by **TWO blank lines (`\n\n`)**.
- An item of detail description must start with `-` prefix.
                  ]],
                  vim.fn.system("git diff --no-ext-diff --staged"),
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
            llm = function(adapter)
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
            groups = {
              ["the_danger"] = {
                description = "Full Stack Developer - Can run code, edit code and modify files",
                system_prompt = "**DO NOT** make any assumptions about the dependencies that a user has installed. If you need to install any dependencies to fulfil the user's request, do so via the Command Runner tool. If the user doesn't specify a path, use their current working directory.",
                tools = {
                  "cmd_runner",
                  "editor",
                  "files",
                  "mcp",
                  "vectorcode"
                },
              },
            },
            ["mcp"] = {
              callback = function() return require("mcphub.extensions.codecompanion") end,
              description = "Call tools and resources from the MCP Servers",
              opts = {
                requires_approval = true,
              }
            },
            ["vectorcode"] = {
              callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
              description = "Run VectorCode to retrieve the project context.",
            },
          }
        }
      },
      display = {
        chat = {
          show_header_separator = true,
          window = {
            width = 70
          },
          message_formatter = "render-markdown"
        },
        diff = {
          enabled = true,
        }
      }
    })
  end
}
