vim.api.nvim_create_user_command(
  "Test",
  function ()
    vim.cmd("terminal pnpm vitest run %")
  end,
  { nargs = "*" }
)
