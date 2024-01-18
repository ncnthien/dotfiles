return {
	"nvim-telescope/telescope.nvim", tag = "0.1.5",
  name = "telescope",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" }
	},
}
