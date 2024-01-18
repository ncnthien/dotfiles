return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    { "<leader>hh", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon" },
    { "<leader>ha", function() require("harpoon"):list():append() end, desc = "Harpoon mark file" },
    { "<S-Left>", function() require("harpoon"):list():prev() end, desc = "Harpoon prev mark" },
    { "<S-Right>", function() require("harpoon"):list():next() end, desc = "Harpoon next mark" },
    { "<S-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon select 1" },
    { "<S-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon select 2" },
    { "<S-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon select 3" },
    { "<S-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon select 4" },
  },
}
