return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    -- On the main branch parsers are installed explicitly (async).
    require("nvim-treesitter").install({
      "typescript",
      "tsx",
      "markdown",
      "markdown_inline",
    })

    -- Highlighting and indentation are enabled per-buffer via native
    -- vim.treesitter APIs (the main branch no longer wires this up itself).
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf = args.buf
        -- start highlighting only when a parser is available for this buffer
        if pcall(vim.treesitter.start, buf) then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
