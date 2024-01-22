return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      filetypes = {
        javascript = true,
        typescript = true,
        lua = true
      }
    })
  end
}
