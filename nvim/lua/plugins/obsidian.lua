return {
  "epwalsh/obsidian.nvim",
  version = "*",
  name = "obsidian",
  keys = {
    { "<leader>zz", "<cmd>ObsidianQuickSwitch<cr>", desc = "ObsidianQuickSwitch" },
    { "<leader>zn", "<cmd>ObsidianNew<cr>", desc = "ObsidianNew" },
    { "<leader>zs", "<cmd>ObsidianSearch<cr>", desc = "ObsidianSearch" },
    { "<leader>zw", "<cmd>ObsidianWorkspace<cr>", desc = "ObsidianWorkSpace" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-treesitter"
  },
  config = function()
    vim.opt.conceallevel = 2
    require("obsidian").setup({
      workspaces = {
        { name = "work", path = "~/vaults/work" },
        { name = "ncnthien", path = "~/vaults/ncnthien" }
      },
      picker = {
        name = "fzf-lua",
      },
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date("%y%m%d%H%M")) .. "-" .. suffix
      end,
    })
  end,
}
