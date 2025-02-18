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
    vim.cmd("!switch-env " .. environment)
  end,
  { nargs = 1 }
)
