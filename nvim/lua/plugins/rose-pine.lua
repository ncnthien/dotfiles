return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
    require('rose-pine').setup({
      styles = {
        transparency = true,
      },
      highlight_groups = {
        StatusLine = { fg = "foam", bg = "foam", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },
      },
    })
		vim.cmd([[colorscheme rose-pine]])
	end
}
