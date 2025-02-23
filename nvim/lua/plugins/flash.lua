return {
  "folke/flash.nvim",
  event = "VeryLazy",
  otps = {
    labels = "asdfghjklwertyuioxcvbn",
    label = {
      uppercase = false,
    },
    modes = {
      char = {
        enabled = false
      }
    }
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
