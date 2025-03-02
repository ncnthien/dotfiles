vim.api.nvim_create_user_command(
  "Test",
  function ()
    local path = vim.fn.expand("%:p")
    path = path:gsub('%(', '\\('):gsub('%)', '\\)')
    vim.cmd("terminal pnpm vitest run " .. path)
  end,
  { nargs = "*" }
)

vim.api.nvim_create_user_command(
  "Env",
  function(opts)
    local environment = opts.args
    vim.cmd("!env-manager switch " .. environment)
  end,
  {
    nargs = 1,
    desc = "Set environment",
    complete = function(ArgLead)
      local environments = { "sit", "uat", "dev" }
      local matches = {}
      for _, env in ipairs(environments) do
        if env:find(ArgLead, 1, true) == 1 then
          table.insert(matches, env)
        end
      end
      return matches
    end
  }
)

vim.api.nvim_create_user_command(
  "Token",
  function(opts)
    local token = opts.args
    vim.cmd("!env-manager token " .. token)
  end,
  {
    nargs = 1,
    desc = "Set token"
  }
)
