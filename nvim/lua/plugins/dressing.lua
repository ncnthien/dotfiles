return {
  'stevearc/dressing.nvim',
  config = function ()
    require('dressing').setup({
      input = {
        relative = "win"
      }
    })
  end,
  enabled = false
}
