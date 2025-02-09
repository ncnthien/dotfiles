local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
  spec = { { import = "plugins" } },
  ui = { border = "single" },
  change_detection = { notify = false }
})

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.statusline")
require("config.usercmds")
