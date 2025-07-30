-- We are using mini.basic for most options.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Show vertical lines at 80 and 120 characters.
vim.opt.colorcolumn = "80,120"

-- Relative line numbers.
vim.opt.relativenumber = true

-- Keep context lines around the cursor.
vim.opt.scrolloff = 8

-- mini.basic changes this to stop `~` being shown past the end of the buffer.
-- We are reverting that change.
vim.opt.fillchars = ""

-- Always use spaces instead of tabs.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Display leading and trailing spaces in addition to what mini.basic provides.
vim.opt.listchars = {
  tab = "|->",
  precedes = "…",
  extends = "…",
  trail = "·",
  lead = "·",
  nbsp = "␣",
}

-- Add fuzzy matching.
vim.opt.completeopt = "menuone,noselect,fuzzy"

-- Folds
vim.opt.foldcolumn = "0"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""

vim.opt.foldnestmax = 3
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
