return {
  "folke/flash.nvim",
  event = "VeryLazy",
  otps = {
    labels = "asdfghjklwertyuioxcvbn",
    label = {
      uppercase = false,
    }
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
