return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    config = function()
      local ts = require("nvim-treesitter")

      local languages = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "vim",
        "vimdoc",
      }
      ts.install(languages)
      ts.update()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = ts.get_installed(),
        callback = function()
          vim.treesitter.start() -- Syntax highlighting.
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", opts = { enabled = true, max_lines = "30%" } },
}
