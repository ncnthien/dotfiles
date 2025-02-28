local function augroup(name)
  return vim.api.nvim_create_augroup("ncnthien_" .. name, { clear = true })
end

local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true
  })
end

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup("UserLspConfig"),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>cx', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>cf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>cq', quickfix, opts)
    vim.keymap.set('n', '<leader>cs', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'tn', function ()
      vim.diagnostic.goto_next()
      vim.cmd('normal! zz')
    end , opts)
    vim.keymap.set('n', 'tp', function ()
      vim.diagnostic.goto_prev()
      vim.cmd('normal! zz')
    end, opts)

    local signs = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
})

-- Auto run eslint fix before save if eslint is installed
vim.api.nvim_create_autocmd('BufWritePre', {
  group = augroup("Eslint"),
  callback = function()
    if vim.fn.exists(':EslintFixAll') > 0 then vim.cmd('EslintFixAll') end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 50 })
  end,
})
