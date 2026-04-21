-- TREESITTER MANAGER ---------------------------------------------------------
vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })

require("tree-sitter-manager").setup({
  ensure_installed = {
    -- Lua
    "lua",
    "luadoc",
    "luap",
    -- Git
    "diff",
    "gitattributes",
    "gitcommit",
    "git_config",
    "gitignore",
    "git_rebase",
    -- Markdown
    "markdown",
    "markdown_inline",
    -- Other
    "editorconfig",
    "python",
    "tmux",
    "yaml",
    "zsh",
  },
  auto_install = true,
})

-- TREESITTER CONTEXT ---------------------------------------------------------
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })
require("treesitter-context").setup({ max_lines = 5 })
