local stl = {
  '[%{FugitiveHead()}] ',
  '%f',
  '%m',
  '%=',
  '%{&filetype}',
}

vim.opt.statusline = table.concat(stl)
