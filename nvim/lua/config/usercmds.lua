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
  "Dev",
  function ()
    vim.cmd("silent !switch-env dev")
  end,
  { nargs = "*" }
)

vim.api.nvim_create_user_command(
  "Uat",
  function ()
    vim.cmd("silent !switch-env uat")
  end,
  { nargs = "*" }
)

vim.api.nvim_create_user_command(
  "Sit",
  function ()
    vim.cmd("silent !switch-env sit")
  end,
  { nargs = "*" }
)
