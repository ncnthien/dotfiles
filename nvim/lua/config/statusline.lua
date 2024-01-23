vim.api.nvim_exec(
[[
  hi PrimaryBlock   ctermfg=06 ctermbg=00
  hi SecondaryBlock ctermfg=08 ctermbg=00
  hi Blanks   ctermfg=07 ctermbg=00
]], false)

local stl = {
  '%#PrimaryBlock#',
  '%#Blanks#',
  '[%{FugitiveHead()}] ',
  '%#SecondaryBlock#',
  '%f',
  '%m',
  '%=',
  '%#SecondaryBlock#',
  '%l,%c ',
  '%#PrimaryBlock#',
  '%{&filetype}',
}

vim.opt.statusline = table.concat(stl)
