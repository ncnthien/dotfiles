return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    { "<leader>hh", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon" },
    { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon mark file" },
    { "<S-h>", function() require("harpoon"):list():prev() end, desc = "Harpoon prev mark" },
    { "<S-l>", function() require("harpoon"):list():next() end, desc = "Harpoon next mark" },
    { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon select 1" },
    { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon select 2" },
    { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon select 3" },
    { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon select 4" },
    { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Harpoon select 5" },
    { "<leader>6", function() require("harpoon"):list():select(6) end, desc = "Harpoon select 6" },
    { "<leader>7", function() require("harpoon"):list():select(7) end, desc = "Harpoon select 7" },
    { "<leader>8", function() require("harpoon"):list():select(8) end, desc = "Harpoon select 8" },
    { "<leader>9", function() vim.cmd([[ b# ]]) end, desc = "Select previous buffer" },
  },
}
