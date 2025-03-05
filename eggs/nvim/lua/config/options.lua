vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.undofile = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,120"

-- Line numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep context lines around the cursor.
vim.opt.scrolloff = 8
vim.opt.cursorline = true

-- Smart case during search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always use spaces instead of tabs.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.breakindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- Display certain whitespace characters.
vim.opt.list = true
vim.opt.listchars = { tab = "|->", trail = "·", lead = "·", nbsp = "␣" }

-- Mode is already shown in the statusline.
vim.opt.showmode = false
