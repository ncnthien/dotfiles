local function color(group_name, item)
  return '%#' .. group_name .. '#' .. item .. '%*'
end

local pallettes = require('nightfox.palette').load('nordfox')
local hl = vim.api.nvim_set_hl
local diagnostic_error_group = 'DiagnosticError'
local diagnostic_warn_group = 'DiagnosticWarn'
local diagnostic_hint_group = 'DiagnosticHint'
local diagnostic_info_group = 'DiagnosticInfo'

hl(0, diagnostic_error_group, { fg = pallettes.red.base, bg = pallettes.bg0 })
hl(0, diagnostic_warn_group, { fg = pallettes.yellow.base, bg = pallettes.bg0  })
hl(0, diagnostic_hint_group, { fg = pallettes.cyan.base, bg = pallettes.bg0  })
hl(0, diagnostic_info_group, { fg = pallettes.orange.base, bg = pallettes.bg0  })

local diagnostic_error_group_sign = 'DiagnosticSignError'
local diagnostic_warn_group_sign = 'DiagnosticSignWarn'
local diagnostic_hint_group_sign = 'DiagnosticSignhint'
local diagnostic_info_group_sign = 'DiagnosticSignInfo'

hl(0, diagnostic_error_group_sign, { fg = pallettes.red.base })
hl(0, diagnostic_warn_group_sign, { fg = pallettes.red.base })
hl(0, diagnostic_hint_group_sign, { fg = pallettes.red.base })
hl(0, diagnostic_info_group_sign, { fg = pallettes.red.base })

local diagnostic_error_group_floating = 'DiagnosticFloatingError'
local diagnostic_warn_group_floating = 'DiagnosticFloatingWarn'
local diagnostic_hint_group_floating = 'DiagnosticFloatinghint'
local diagnostic_info_group_floating = 'DiagnosticFloatingInfo'

hl(0, diagnostic_error_group_floating, { fg = pallettes.red.base })
hl(0, diagnostic_warn_group_floating, { fg = pallettes.red.base })
hl(0, diagnostic_hint_group_floating, { fg = pallettes.red.base })
hl(0, diagnostic_info_group_floating, { fg = pallettes.red.base })

local get_error = function()
  return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
end
local get_warn = function()
  return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
end
local get_hint = function()
  return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
end
local get_info = function()
  return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
end

function Get_status_line()
  local errors = get_error()
  local warns = get_warn()
  local hints = get_hint()
  local infos = get_info()

  local errors_message = errors > 0 and string.format('%s',color(diagnostic_error_group, string.format(' %s', errors))) or ''
  local warns_message = warns > 0 and string.format('%s', color(diagnostic_warn_group, string.format('  %s', warns))) or ''
  local hints_message = hints > 0 and string.format('%s', color(diagnostic_hint_group, string.format('  %s', hints))) or ''
  local infos_message = infos > 0 and string.format('%s', color(diagnostic_info_group, string.format('  %s', infos))) or ''

  return string.format('%s%s%s%s%s%s%s%s %s', '[%{FugitiveHead()}] ', '%f', '%m', '%=', errors_message,
    warns_message, hints_message, infos_message, '%{&filetype}')
end

vim.opt.statusline = '%!v:lua.Get_status_line()'
