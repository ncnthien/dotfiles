return {
	"nvim-telescope/telescope.nvim", tag = "0.1.5",
  name = "telescope",
	dependencies = { "nvim-lua/plenary.nvim" },
  event = "VimEnter",
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Live grep" },
		{ "<leader>/", "<cmd>Telescope grep_string<cr>", mode = "v", desc = "String grep" }
	},
  config = function()
    require('telescope.builtin').find_files()
  end
}
