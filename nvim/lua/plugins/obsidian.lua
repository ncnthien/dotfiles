return {
  "epwalsh/obsidian.nvim",
  version = "*",
  name = "obsidian",
  keys = {
    { "<leader>zz", "<cmd>ObsidianQuickSwitch<cr>", desc = "ObsidianQuickSwitch" },
    { "<leader>zn", "<cmd>ObsidianNew<cr>", desc = "ObsidianNew" },
    { "<leader>zs", "<cmd>ObsidianSearch<cr>", desc = "ObsidianSearch" },
    { "<leader>zw", "<cmd>ObsidianWorkspace<cr>", desc = "ObsidianWorkSpace" },
    { "<leader>zd", "<cmd>ObsidianToday<cr>", desc = "ObsidianToday" },
    { "<leader>zy", "<cmd>ObsidianYesterday<cr>", desc = "ObsidianYesterday" }
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
        { name = "ncnthien", path = "~/vaults/ncnthien" },
        { name = "personal", path = "~/vaults/personal" },
      },
      picker = {
        name = "fzf-lua",
      },
      daily_notes = {
        folder = "dailies",
        default_tags = { "daily" },
        template = "daily.md",
        date_format = "%y%m%d%a",
        alias_format = "%y-%m-%d",
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d-%a",
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
      note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases, hubs = {} }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
    })
  end,
}
