return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      input = {
        enabled = true,
        default_prompt = "Input:",
        prompt_align = "center",
        insert_only = true,
        border = "single",
        relative = "win",
      },
      select = {
        enabled = true,
        backend = { "builtin" },
        builtin = {
          border = "single",
          relative = "win",
        },
      },
    })
  end
}
