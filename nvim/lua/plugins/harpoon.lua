return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      ["env"] = {
        create_list_item = function (_, name)
          return {
            value = name,
            context = {}
          }
        end,
        display = function(list_item)
          return list_item
        end,
        equals = function(list_item_a, list_item_b)
          if list_item_a == nil and list_item_b == nil then
            return true
          elseif list_item_a == nil or list_item_b == nil then
            return false
          end
          return list_item_a== list_item_b
        end,
        get_root_dir = function()
          return vim.loop.cwd()
        end,
        select = function(list_item)
          vim.cmd("!switch-env " .. list_item.value)
        end
      }
    })

    vim.api.nvim_create_user_command(
      "HarpoonEnv",
      function()
        harpoon.ui:toggle_quick_menu(harpoon:list("env"))
      end,
      {}
    )

    vim.api.nvim_create_user_command(
      "HarpoonEnvAdd",
      function(opts)
        local env = opts.fargs[1]
        harpoon:list("env"):add(env)
      end,
      { nargs = 1 }
    )

  end,
  keys = {
    { "<leader>hh", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon" },
    { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon mark file" },
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
