local function color(group_name, item)
  return '%#' .. group_name .. '#' .. item .. '%*'
end

-- Gruvbox light palette
local palette = {
  bg0 = "#d5c4a1",    -- light background
  red = "#cc241d",    -- errors
  yellow = "#d65d0e", -- warnings
  green = "#98971a",  -- hints
  blue = "#458588",   -- info
}

local hl = vim.api.nvim_set_hl

local diagnostic_error_group = 'DiagnosticError'
local diagnostic_warn_group = 'DiagnosticWarn'
local diagnostic_hint_group = 'DiagnosticHint'
local diagnostic_info_group = 'DiagnosticInfo'

hl(0, diagnostic_error_group, { fg = palette.red })
hl(0, diagnostic_warn_group, { fg = palette.yellow })
hl(0, diagnostic_hint_group, { fg = palette.green })
hl(0, diagnostic_info_group, { fg = palette.blue })

local diagnostic_error_group_status = 'DiagnosticStatusError'
local diagnostic_warn_group_status = 'DiagnosticStatusWarn'
local diagnostic_hint_group_status = 'DiagnosticStatusHint'
local diagnostic_info_group_status = 'DiagnosticStatusInfo'

hl(0, diagnostic_error_group_status, { fg = palette.red, bg = palette.bg0 })
hl(0, diagnostic_warn_group_status, { fg = palette.yellow, bg = palette.bg0 })
hl(0, diagnostic_hint_group_status, { fg = palette.green, bg = palette.bg0 })
hl(0, diagnostic_info_group_status, { fg = palette.blue, bg = palette.bg0 })

local diagnostic_error_group_sign = 'DiagnosticSignError'
local diagnostic_warn_group_sign = 'DiagnosticSignWarn'
local diagnostic_hint_group_sign = 'DiagnosticSignHint'
local diagnostic_info_group_sign = 'DiagnosticSignInfo'

hl(0, diagnostic_error_group_sign, { fg = palette.red })
hl(0, diagnostic_warn_group_sign, { fg = palette.yellow })
hl(0, diagnostic_hint_group_sign, { fg = palette.green })
hl(0, diagnostic_info_group_sign, { fg = palette.blue })

local diagnostic_error_group_floating = 'DiagnosticFloatingError'
local diagnostic_warn_group_floating = 'DiagnosticFloatingWarn'
local diagnostic_hint_group_floating = 'DiagnosticFloatingHint'
local diagnostic_info_group_floating = 'DiagnosticFloatingInfo'

hl(0, diagnostic_error_group_floating, { fg = palette.red })
hl(0, diagnostic_warn_group_floating, { fg = palette.yellow })
hl(0, diagnostic_hint_group_floating, { fg = palette.green })
hl(0, diagnostic_info_group_floating, { fg = palette.blue })

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

  local errors_message = errors > 0 and string.format('%s', color(diagnostic_error_group_status, string.format(' %s', errors))) or ''
  local warns_message = warns > 0 and string.format('%s', color(diagnostic_warn_group_status, string.format('  %s', warns))) or ''
  local hints_message = hints > 0 and string.format('%s', color(diagnostic_hint_group_status, string.format('  %s', hints))) or ''
  local infos_message = infos > 0 and string.format('%s', color(diagnostic_info_group_status, string.format('  %s', infos))) or ''

  return string.format('%s%s%s%s%s%s%s%s %s', '[%{FugitiveHead()}] ', '%f', '%m', '%=', errors_message,
    warns_message, hints_message, infos_message, '%{&filetype}')
end

vim.opt.statusline = '%!v:lua.Get_status_line()'
